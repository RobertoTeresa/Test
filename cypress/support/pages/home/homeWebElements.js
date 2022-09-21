class homeWebElements {
    get AcceptCookiesButton() { return cy.get('#onetrust-accept-btn-handler')}
    get MenuActivity() { return cy.get('.nav > :nth-child(4) > a')}
    get EduCaixaLogin(){ return cy.get('#dialog_iframe_')}
    get UserAccess(){return cy.get('#user')}
    get LoginProfileButton(){return cy.get('.myeducaixa-log-in > .color-caixa-blue')}
    get LoginEmailInput(){return cy.get('#_EducaixaMyeducaixaLogin_login-field')}
    get LoginPasswordInput(){return cy.get('input[name="_EducaixaMyeducaixaLogin_password"]')}
    get LoginButton(){return cy.get('.lfr-btn-label')}
    get ActivityDelete() { return cy.get('.delete')}
    get WhatIsEduCaixaLink() { return cy.get('[href="/es/web/guest/que-es-educaixa"]')}
    get ExperiencesLink() { return cy.get('[href="/es/web/guest/experiencias"]')}
    get OurCentersLink() { return cy.get('[href="/es/web/guest/centros"]')}
    get ContactLink() { return cy.get('[href="/es/web/guest/contacta-con-nosotros"]')}
}
export default new homeWebElements();                  