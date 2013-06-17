##BankRun

See where your money goes.

###Install

	npm install bank-run -g

###Create a configuration JSON file

	{
		"Chase": {
			"user": "",		/* Account username */
			"pass": "",		/* Account password */
			"accid": 0000,  /* Account number */
			"bankid": null,	/* Bank routing number (if bank account) */
			"acctype": "CREDITCARD",
			"fid": 10898,
			"fidorg": "B1",
			"url": "https://ofx.chase.com",
			"date_start": 20120601,
			"date_end": 20130616
		},
		"Amex": {
			"user": "",		/* Account username */
			"pass": "",		/* Account password */
			"accid": 0000,  /* Account number */
			"bankid": null,	/* Bank routing number (if bank account) */
			"acctype": "CREDITCARD",
			"fid": 3101,
			"fidorg": "AMEX",
			"url": "https://online.americanexpress.com/myca/ofxdl/desktop/desktopDownload.do?request_type=nl_ofxdownload",
			"date_start": 20120601,
			"date_end": 20130616
		}
	}

[Find your bank information here](http://www.ofxhome.com/index.php/home/directory).

###Execute bank-run

	bank-run <path-to-json> <sort:amount|count>

### Stay up to date

[Watch this project](https://github.com/winton/bank-run#) on Github.

[Follow Winton Welsh](http://twitter.com/intent/user?screen_name=wintonius) on Twitter.
