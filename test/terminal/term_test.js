var Term = require ('../../terminal/term.js');

describe("Terminal output", function() {

    it("does stuff", function() {
        console.log(Term);
        var one = 1;
        (one == 2).should.be.true;
    });
});