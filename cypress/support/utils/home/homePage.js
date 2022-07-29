import homeWebElements from "./homeWebElements";
import 'cypress-iframe'

class homePage {
    urlHomePage = "https://usuario:FA25zL27as@pre.educaixa.org/es/web/guest/"
    //urlHomePage = "https://www.educaixa.org/es/home";

    visitHomePage() {
        Cypress.on('uncaught:exception', (err, runnable) => {
            console.log("err :" + err);
            console.log("runnable :" + runnable);
            return false;
        });
        cy.visit(this.urlHomePage);
        cy.wait(300);
    }

    acceptCookies() {
        Cypress.on('uncaught:exception', (err, runnable) => {
            console.log("err :" + err);
            console.log("runnable :" + runnable);
            return false;
        })
        homeWebElements.AcceptCookiesButton
            .should('be.visible')
            .click()
    }

    login(user, password) {
        homeWebElements.UserAccess.click({ force: true });
        homeWebElements.LoginProfileButton.click({ force: true });
        cy.frameLoaded('#dialog_iframe_');
        cy.iframe('#dialog_iframe_')
            .find('#_EducaixaMyeducaixaLogin_login-field')
            .type(user);
        cy.iframe('#dialog_iframe_')
            .find('#_EducaixaMyeducaixaLogin_password-field')
            .type(password);
        cy.wait(200);
        cy.iframe('#dialog_iframe_')
            .find('.lfr-btn-label')
            .click({ force: true });
        cy.wait(200);
        cy.reload();
    }
}
export default new homePage();                  