##BankRun

[![NPM version](https://badge.fury.io/js/bank-run.png)](http://badge.fury.io/js/bank-run)

Basic statistics about your bank/credit transactions.

BankRun uses your bank's OFX provider to download and analyze transaction data directly from your machine.

###Install

	npm install bank-run -g

###Create a configuration JSON file

	{
		"Chase": {
			"user": "",					/* Account username */
			"pass": "",					/* Account password */
			"accid": 0000,  			/* Account number */
			"bankid": null,				/* Bank routing number (if bank account) */
			"acctype": "CREDITCARD",	/* CHECKING || SAVINGS || MONEYMRKT || CREDITCARD */
			"date_start": 20120601,		/* Statement start date YYYYMMDDHHMMSS */
			"date_end": 20130616,		/* Statement end date YYYYMMDDHHMMSS */
			"fid": 10898,
			"fidorg": "B1",
			"url": "https://ofx.chase.com"
		},
		"Amex": {
			"user": "",					/* Account username */
			"pass": "",					/* Account password */
			"accid": 0000,  			/* Account number */
			"bankid": null,				/* Bank routing number (if bank account) */
			"acctype": "CREDITCARD",	/* CHECKING || SAVINGS || MONEYMRKT || CREDITCARD */
			"date_start": 20120601,		/* Statement start date YYYYMMDDHHMMSS */
			"date_end": 20130616,		/* Statement end date YYYYMMDDHHMMSS */
			"fid": 3101,
			"fidorg": "AMEX",
			"url": "https://online.americanexpress.com/myca/ofxdl/desktop/desktopDownload.do?request_type=nl_ofxdownload"
		}
	}

[Find your bank information here](http://www.ofxhome.com/index.php/home/directory).

###Execute bank-run

	bank-run <path-to-json> <sort:amount|count>

### Stay up to date

[Watch this project](https://github.com/winton/bank-run#) on Github.

[Follow Winton Welsh](http://twitter.com/intent/user?screen_name=wintonius) on Twitter.
