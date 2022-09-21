class activityWebElements {
    get ActivityFilter() { return cy.get('#area-filter-select')}
    get ActivityFilterButton() { return cy.get('.showTags')}
    get ActivityFilterListCenter() { return cy.get('#centroflc-filter-select option')}
    get ActivityBookmark() {cy.get(':nth-child(4) > .col-lg-12 > :nth-child(4) > .card-share > .card-actions > .bookmark > #bookmark')}
    get ActivityList() { return cy.get('.mod-filtros-landings__resultados')}
    get FirstActivity() { return cy.get(':nth-child(4) > .col-lg-12 > .element-text > a > .element-title')}
}
export default new activityWebElements();                  