# <img src="./images/mocha-dark-logo.svg" alt="Mocha Logo" /> Contributing to mocha-dark

☕️ A dark color scheme for Mocha, the Simple, flexible, fun JavaScript test framework for Node.js &amp; The Browser. ☕️

## Developing

*Node*: Check that Node is [installed](https://nodejs.org/en/download/) with version 12 and up. You can check this with `node -v`.

*nvm*: You can use [Node Version Manager](https://github.com/nvm-sh/nvm) to switch between versions of node and the project contains a *.nvmrc* configuration file to select the version to use.

*pnpm*: Make sure that pnpm is [installed](https://pnpm.js.org/installation/) with version >= `3`.  You should do this after you have sourced *env.local* to install into the version of node that nvm has activated.

### Setup

Fork the `mocha-dark` repository to your GitHub Account.

Then, run:

```sh
$ git clone https://github.com/<your-github-username>/mocha-dark
$ cd mocha-dark
$ bash
$ source env.local
$ npm install -g pnpm
$ pnpm install
```

#### env.local

By sourcing `env.local` you will get *npm* aliased to *pnpm* and will have the correct *node* version via *nvm* as well as get your *PATH* and some other environment variables set for you.

You should define the `BROWSER` and `VDIFF` values in your own copy of `env.local` to specify what browser to run the tests in which and visual comparison tool to use.

### Testing

You can open the mocha and mocha-dark sample browser test plan via:

```sh
make test
```

The sample test shows a passing, failing and skipped/pending test so you can see all possible combinations of the color theme elements.

### Testing light/dark switch

You can change the `mocha-dark-test.html` to use light or dark scheme via two commands:

```sh
npm run test:dark

npm run test:light
```

This will set the initial load scheme for the dark test page. Remember if you then view the page through a web server you can change and remember the scheme for next reload.  Otherwise loading through `file://` will forget the changed setting on each refresh.

### Updating for a new Mocha release

When the mocha team releases a new version we need to check whether the CSS needs changing and incorporate any new styles.

* Install the new version of mocha locally. `pnpm install --save-dev mocha`
* run `./diffmocha.sh` to compare the new release against our code and incorporate any needed changes (`mocha.css`, `mocha.js`, and `package.json`).
* run `make depends` and `pnpm install` to install any new *mocha* dependencies.
* run `make test` and ensure the visual style is still clear and all features work.
* update our package version to match Mocha:

```sh
bump.sh "to match Mocha release" `npm view mocha version`
```

* log in to npm with `npm login`
* release the package to npm with `make publish`

## TODO

* First, check mocha tests in browser working, then dark scheme, then update mocha to latest and update css
* Use cypress to run the in browser test and capture screen shot
* .html for browser testing
* use of mocha dark color
* submit pull request for mocha dark
