describe('Homepage', () => {
  it('should visit the homepage', () => {
    cy.visit('/');
  });

  it("should have products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should only show 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
  
});