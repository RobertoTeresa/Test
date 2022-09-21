class activityRoamingCardWebElements {
    get ActivityRoamingCardMoreInfoLabel() { return cy.get('#centro-itinerante-label')}
    get ActivityRoamingCardMoreInfoPopUp() { return cy.get('#centro-itinerante-info-popup')}
    get ActivityRoamingCardPreOrdeButton() { return cy.get('#btn-comprar')}
}
export default new activityRoamingCardWebElements();         