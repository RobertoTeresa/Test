class activityCardWebElements {
    get ActivityCard() { return cy.get('.asset-full-content')}
    get ActivityCardTitle() { return cy.get('.box-img-title-rec')}
    get ActivityCardSubTitle() { return cy.get('.box-img-sub-title-rec')}
    get ActivityCardCosmoCaixaMessage() { return cy.get('#actividad-obligatoria')}
    get ActivityCardPrice() { return cy.get('#precio-actividad')}
    get ActivityCardPromotion() { return cy.get('#promociones-actividad')}
    get ActivityCardCapacityLabel() { return cy.get('#aforo-label')}
    get ActivityCardCapacityValue() { return cy.get('#aforo-value')}
    get ActivityCardDurationLabel() { return cy.get('#duracion-label')}
    get ActivityCardDurationValue() { return cy.get('#duracion-value')}
    get ActivityCardRating() { return cy.get('.card-actions > .statistics')}
    get ActivityCardShareButton() { return cy.get('#share')}
    get ActivityCardBookmarkButton() { return cy.get('#bookmark')}
    get ActivityCardEducationLevelTitle() { return cy.get(':nth-child(1) > .titular-section > .purple-title')}
    get ActivityCardEducationLevelText() { return cy.get(':nth-child(1) > .titular-section > .purple-title')}
    get ActivityCardKnowledgeAreaTitle() { return cy.get(':nth-child(2) > .titular-section > .purple-title')}
    get ActivityCardKnowledgeAreaText() { return cy.get('.info-view > .row > :nth-child(2) > ul')}
    get ActivityCardActivitySkillsTitle() { return cy.get(':nth-child(3) > .titular-section > .purple-title')}
    get ActivityCardActivitySkillsText() { return cy.get(':nth-child(3) > ul > .marked')}
    get ActivityCardPreOrderButton () { return cy.get('#center-btn-buy') }
    get ActivityCardCenterSelector () { return cy.get('.center-selection-container-trick') }
    get ActivityCardCenterList () { return cy.get('#select-center-dropdown > div') }
    get ActivityCardPreferenceCenterCheckLabel () { return cy.get('#center-selection-check')}
    get ActivityCardPreferenceCenterCheck () { return cy.get('#center-checked')}
    get ActivityCardSchedule() { return cy.get('#center-schedule')}
    get ActivityCardDescription() { return cy.get('.section-content-objetivos > .container > .row > .col-md-7')}
    get ActivityCardObjetives() { return cy.get('.section-content-objetivos > .container > .row > .col-md-5')}
    get ActivityCardDownloads() { return cy.get('.materias-y-descargas__content > a')}
    get ActivityCardInformation() { return cy.get('.informacion-adicional > .container')}
    get ActivityCardFileRating() { return cy.get('#statistics > .circular-chart')}
    get ActivityCardRateAndCommentButton() { return cy.get('#show-modal-login')}
    get ActivityCardRateAndCommentButtonLogged() { return cy.get('#cta-valoracion-ficha')}
    get ActivityCardRateAndCommentWindow() { return cy.get('#modal-valoracion')}
    get ActivityCardBackButton() { return cy.get('.header-back-to')}

}
export default new activityCardWebElements();                  