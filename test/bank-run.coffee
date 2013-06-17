BankRun  = require("../lib/bank-run")
bank_run = null

describe 'BankRun', ->
  describe '#constructor', ->
    before ->
      bank_run = new BankRun

    it 'should return an instance of BankRun', ->
      bank_run.should.be.an.instanceof(BankRun)