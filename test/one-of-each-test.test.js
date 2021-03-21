var chai = chai || require('chai');
var assert = chai.assert;
var expect = chai.expect;
var should = chai.should;

var perl = {
_value: function() {
    return void 0
}
}

// Demonstrate one passing, one failing and one skipped/pending test (for color scheme)

describe('Mocha Test Suite showing all possiblities', function() {
  describe('a sub suite grouping()', function() {
    it('should show a PASSING test with good visible clarity.', function() {
      var r = assert.equal(-1, [1, 2, 3].indexOf(4)); // result
    });
    it('should show a failed test with good visible clarity.', function() {
      assert.deepEqual(
        ['The quick brown fox jumped over the lazy dog', 'burma'],
        ['Dhe quik fox humpd under the dog', 'shave']);
    });
    it('should show a skipped/pending test with good visible clarity.');
    it('should style the test source code when expanded (click me to expand)', function () {
        // debugger;
        // This test has semantic init, keyword, comment, string, number
        // to test mocha light/dark color scheme when viewing test detail
        // in the browser.
        var expected = 45;
        expect(45).to.equal(expected)
        expect(perl._value('undef')).to.equal(void should)
        expect(perl._value('undef' /* an inline comment */)).to.equal(
            void new Date()
        )
    })
  });
});
