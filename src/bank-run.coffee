for key, value of require('./bank-run/common')
  eval("var #{key} = value;")

https = require('https')
https.globalAgent.options.secureProtocol = 'SSLv3_method'

module.exports = class BankRun
  constructor: (json, sort='amount') ->
    all_totals = []
    json       = require(json)
    promise    = Q.resolve()
    @sort      = sort

    _.each json, (account_info, account_name) =>
      promise = promise.then(=>
        @getStatement(account_info)
      ).then (res) =>
        console.log "\n#{account_name}"
        console.log "#{Array(account_name.length + 1).join("#")}\n"
        
        totals = _.inject(
          res.OFX.CREDITCARDMSGSRSV1.CCSTMTTRNRS.CCSTMTRS.BANKTRANLIST.STMTTRN
          (hash, trans) ->
            hash[trans.NAME] ||= { amount: 0, count: 0 }
            hash[trans.NAME].amount += trans.TRNAMT
            hash[trans.NAME].count += 1
            hash
          {}
        )

        all_totals.push(totals)
        @processTotals(totals)
    
    promise.then(=>
      all_totals = _.inject(
        all_totals
        (hash, total) ->
          _.each total, (values, name) =>
            hash[name] ||= { amount: 0, count: 0 }
            hash[name].amount += values.amount
            hash[name].count  += values.count
          hash
        {}
      )

      account_name = "All Accounts"
      console.log "\n#{account_name}"
      console.log "#{Array(account_name.length + 1).join("#")}\n"

      @processTotals(all_totals)
    ).done()

    console.log ""

  getStatement: (account_info) ->
    [ promise, resolve, reject ] = defer()

    Bank.getStatement account_info, (res, err) =>
      if err
        reject(err)
      else
        resolve(res)
    
    promise

  processTotals: (totals) ->
    totals = _.inject(
      totals
      (array, total, name) ->
        array.push([ name, total ])
        array
      []
    )
    totals = totals.sort (a, b) => a[1][@sort] - b[1][@sort]
    _.each totals, (item) ->
      amount = item[1].amount.toFixed(2)
      count  = item[1].count.toString()
      space  = 60 - item[0].length - amount.length
      space2 = 10 - count.length
      console.log(
        item[0]
        Array(space).join(" ")
        amount
        Array(space2).join(" ")
        count
      )