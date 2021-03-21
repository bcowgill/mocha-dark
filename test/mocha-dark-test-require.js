requirejs.config({
	// By default load any module IDs from src/
	baseUrl: 'src',

	// paths config is relative to the baseUrl, and
	// never includes a ".js" extension since
	// the paths config could be for a directory.
	paths: {
		mocha: '../mocha',
		chai: '../node_modules/chai/chai',
	},

	shim: {
		mocha: {
			exports: 'mocha',
		},
	},
});

// Start the tests after loading testing libraries
requirejs(['require', 'mocha', 'chai'], function (require, mocha, chai) {
	// mocha, chai module are all
	// loaded and can be used here now.

	mocha.setup({ ui: 'bdd' });

	// require test plans here.
	require(['./test/one-of-each-test.test.js'], function () {
		mocha.checkLeaks();
		mocha.globals(['jQuery']);
		mocha.run();
	});
});
