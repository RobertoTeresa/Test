import activityPage from "../pages/actividad/activityPage";
import activityWebElements from "../pages/actividad/activityWebElements";
import activityCardPage from "../pages/actividadCard/activityCardPage";
import activityCardWebElements from "../pages/actividadCard/activityCardWebElements";
import activityRoamingCardWebElements from "../pages/actividadCard/activityRoamingCardWebElements";
import homePage from "../pages/home/homePage";
import homeWebElements from "../pages/home/homeWebElements";
import userProfilePage from "../pages/userProfile/userProfilePage";
import userProfileWebElements from "../pages/userProfile/userProfileWebElements";
import '@shelex/cypress-allure-plugin';
const { When, Then, And } = require("@badeball/cypress-cucumber-preprocessor");
var titleactivity;
var documentUrl;


When("Entro en la pagina de actividades de la caixa", () => {
  activityPage.visitPageActivity();
  homePage.acceptCookies();
});

When("Entro en la pagina de actividades de produccion de la caixa", () => {
  Cypress.on('uncaught:exception', (err, runnable) => {
    console.log("err :" + err);
    console.log("runnable :" + runnable);
    return false;
  })
  cy.visit("https://www.educaixa.org/es/home")
  homePage.acceptCookies();
});

Then("Soy dirigido a la pagina de produccion", () => {
  cy.url().should('eq', "https://www.educaixa.org/es/home")
});


Then("Veo el filtro de actividades", () => {
  activityWebElements.ActivityFilter.should('be.visible').should('not.to.match', ':empty');
});

When("Entro en la pagina de la caixa", () => {
  homePage.visitHomePage();
  homePage.acceptCookies();
});

And("hago click en la seccion Actividades en la parte superior", () => {
  homeWebElements.MenuActivity.click();
});

Then("Soy dirigido a la seccion de actividades {string}", (url) => {
  cy.url().should('eq', url)
});

And("Selecciono una actividad {string}", (activityName) => {
  activityPage.clickActivity(activityName);
});

Then("Soy dirigido a la pagina de la actividad {string}", (activityName) => {
  activityCardWebElements.ActivityCardTitle
    .then(($text) => {
      titleactivity = $text.text();
      cy.log(titleactivity)
      assert.deepEqual(activityName, titleactivity);
    });
  activityCardWebElements.ActivityCard.should('be.visible').should('not.to.match', ':empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra el titulo de la actividad", () => {
  activityCardWebElements.ActivityCardTitle.should('be.visible').should('not.to.match', ':empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra el subtitulo de la actividad", () => {
  activityCardWebElements.ActivityCardSubTitle.should('be.visible').should('not.to.match', ':empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra el precio de la actividad {string}", (price) => {
  cy.wait(800);
  activityCardWebElements.ActivityCardPrice.should('be.visible').should('not.to.match', ':empty');
  activityCardWebElements.ActivityCardPrice
    .invoke('text')
    .then((priceActivity) => {
      assert.deepEqual(priceActivity, price)
    });
});

And("Selecciono el centro de actividades {string} y selecciona la actividad {string}", (centro, activityName) => {
  activityPage.centerFilter(centro, activityName);
});

And("Selecciono el centro correspondiente {string} dentro de la actividad", (centro) => {
  activityCardPage.centerFilter(centro);
});

Then("Aparece el mensaje de advertencia de CosmoCaixa {string}", (message) => {
  cy.wait(1000);
  activityCardWebElements.ActivityCardCosmoCaixaMessage.should('be.visible').should('not.to.match', ':empty').contains(message);
});

Then("Se muestran las promociones de la actividad", () => {
  cy.wait(2000);
  activityCardWebElements.ActivityCardPromotion
    .trigger("mousedown")
    .then(() => {
      cy.get('#tooltip-promociones').should('exist')
    });
});

Then("Soy dirigido a la pagina de la actividad donde se muestra el aforo", () => {
  activityCardWebElements.ActivityCardCapacityLabel.should('be.visible').should('not.to.match', ':empty');
  activityCardWebElements.ActivityCardCapacityValue.should('be.visible').should('not.to.match', ':empty');
});

Then("Soy dirigido a la pagina de la actividad donde se la duraci??n de la actividad", () => {
  activityCardWebElements.ActivityCardDurationLabel.should('be.visible').should('not.to.match', ':empty');
  activityCardWebElements.ActivityCardDurationValue.should('be.visible').should('not.to.match', ':empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra la valoraci??n", () => {
  activityCardWebElements.ActivityCardRating.should('be.visible');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra el boton compartir", () => {
  activityCardWebElements.ActivityCardShareButton.should('be.visible');
});

And("Soy dirigido a la pagina de la actividad donde se muestra el boton guardar actividad", () => {
  cy.wait(300);
  activityCardWebElements.ActivityCardTitle.should('be.visible')
  activityCardWebElements.ActivityCardBookmarkButton.should('be.visible');
});

Then("Al pulsar el boton guardar soy llevado al login", () => {
  activityCardWebElements.ActivityCardBookmarkButton.click({ force: true });
  homeWebElements.EduCaixaLogin.should('be.visible');
});

And("Pulso el boton guardar actividad", () => {
  activityCardWebElements.ActivityCardBookmarkButton.click({ force: true });
});

Then("Al acceder a mi perfil la actividad esta guardada {string}", (activityName) => {
  homeWebElements.UserAccess.click();
  userProfileWebElements.UserProfileMyProfileActivity.click();
  userProfileWebElements.UserProfileMyProfileActivityList
    .find('h3')
    .contains(activityName)
    .then(($text) => {
      titleactivity = $text.text();
      cy.log(titleactivity)
      assert.deepEqual(activityName, titleactivity);
    });
  cy.wait(300);
  activityPage.visitPageActivity();
  activityPage.clickActivity(activityName);
  cy.wait(300);
  activityCardWebElements.ActivityCardTitle.should('be.visible');
  activityCardWebElements.ActivityCardBookmarkButton.click({ force: true });
  homeWebElements.ActivityDelete.trigger("click");
});

Then("Soy dirigido a la pagina de la actividad donde se muestra el nivel educativo para poder realizar la actividad", () => {
  activityCardWebElements.ActivityCardEducationLevelTitle.should('be.visible').should('not.to.match', ':empty');
  activityCardWebElements.ActivityCardEducationLevelText.should('be.visible').should('not.to.match', ':empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra el ??rea de conocimiento", () => {
  activityCardWebElements.ActivityCardKnowledgeAreaTitle.should('be.visible').should('not.to.match', ':empty');
  activityCardWebElements.ActivityCardKnowledgeAreaText.should('be.visible').should('not.to.match', ':empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra las competencias de la actividad", () => {
  activityCardWebElements.ActivityCardActivitySkillsTitle.should('be.visible').should('not.to.match', ':empty');
  activityCardWebElements.ActivityCardActivitySkillsText.should('be.visible').should('not.to.match', ':empty');
});

Then("Pulso el boton atras y soy llevado de vuelta a la seccion actividades {string}", (url) => {
  activityCardWebElements.ActivityCardBackButton.click();
  cy.url().should('eq', url);
});

Then("Al pulsar el boton Reservar soy llevado al planificador {string}", (url) => {
  activityCardWebElements.ActivityCardPreOrderButton.click();
  cy.url().should('contain', url);
});

Then("Al pulsar el boton Reservar soy llevado al login", () => {
  activityCardWebElements.ActivityCardPreOrderButton.click();
  homeWebElements.EduCaixaLogin.should('be.visible');
});

Then("No se deberia mostrar el check de centro preferente", () => {
  activityCardWebElements.ActivityCardPreferenceCenterCheck.should('not.be.visible');
});

And("Hago Login en la pagina {string} {string}", (email, password) => {
  homePage.login(email, password);
});

Then("Se deberia mostrar el check de centro preferente", () => {
  activityCardWebElements.ActivityCardPreferenceCenterCheckLabel.should('be.visible');
});

Then("No se deberia mostrar automaticamente el centro preferente {string}", (centro) => {
  activityCardWebElements.ActivityCardCenterSelector
    .then(($text) => {
      assert.notDeepEqual(centro, $text.text);
    });
});

Then("Se deberia mostrar automaticamente el centro preferente {string}", (centro) => {
  activityCardWebElements.ActivityCardCenterSelector.find('div').contains(centro);
});

And("Entro en mi perfil personal", () => {
  homeWebElements.UserAccess.click();
});

And("Entro en la seccion Preferencias en Mi Perfil y cambio el centro de preferencia {string}", (centro) => {
  userProfilePage.changePreferenceCenter(centro);
});

And("Vuelvo a la lista de actividades", (centro) => {
  activityPage.visitPageActivity();
});

And("Lo marco como centro preferente", () => {
  activityCardWebElements.ActivityCardPreferenceCenterCheck.click();
});

Then("Se deberia actualizar automaticamente el centro preferente en mi perfil {string}", (centro) => {
  userProfilePage.checkPreferenceCenter(centro);
});

Then("Se deberian mostrar las sesiones disponibles para mi centro de preferencia", (centropreferencia) => {
  activityCardWebElements.ActivityCardPreferenceCenterCheck.check().should('be.checked');
  activityCardWebElements.ActivityCardSchedule.should('be.visible');
});

Then("Se deberian mostrar las sesiones disponibles", () => {
  activityCardWebElements.ActivityCardSchedule.should('be.visible');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra las descripci??n de la actividad", () => {
  activityCardWebElements.ActivityCardDescription.should('be.visible').should('not.be.empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra los objetivios de la actividad", () => {
  activityCardWebElements.ActivityCardObjetives.should('be.visible').should('not.be.empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra los materiales y descargas de la actividad", () => {
  activityCardWebElements.ActivityCardDownloads.should('be.visible').should('not.be.empty');
});

Then("Soy dirigido a la pagina de la actividad donde se muestra la informaci??n de la actividad", () => {
  activityCardWebElements.ActivityCardInformation.should('be.visible').should('not.be.empty');
});


Then("Soy dirigido a la pagina de la actividad donde se muestra la valoraci??n media de la actividad, los comentarios y el bot??n Valora y comenta", () => {
  activityCardWebElements.ActivityCardFileRating.should('be.visible').should('not.be.empty');
  activityCardWebElements.ActivityCardRateAndCommentButton.should('be.visible').should('not.be.empty');
});

And("Soy dirigido a la pagina de la actividad donde pulso el bot??n Valora y comenta", () => {
  activityCardWebElements.ActivityCardRateAndCommentButton.click({ force: true });
});

Then("Soy dirigido a la pagina de la actividad donde se muestra la valoraci??n media de la actividad, los comentarios y el bot??n Valora y comenta usuario logeado", () => {
  activityCardWebElements.ActivityCardFileRating.should('be.visible').should('not.be.empty');
  activityCardWebElements.ActivityCardRateAndCommentButtonLogged.should('be.visible');
});

And("Soy dirigido a la pagina de la actividad donde pulso el bot??n Valora y comenta usuario logeado", () => {
  activityCardWebElements.ActivityCardRateAndCommentButtonLogged.click();
});

Then("Se muestra la ventana modal de inicio de sesi??n", () => {
  homeWebElements.EduCaixaLogin.should('be.visible');
});

Then("Se muestra la ventana de escribir un comentario", () => {
  activityCardWebElements.ActivityCardRateAndCommentWindow.should('be.visible');
});

And("Hago click en uno de los materiales {string}", (material) => {
  activityCardWebElements.ActivityCardDownloads
    .contains(material)
    .trigger("click")
    .parent()
    .should('have.attr', 'href')
    .then((href) => {
      documentUrl = href;
    })

});

Then("Soy dirigido al material {string}", (FileUrl) => {
  assert.deepEqual(FileUrl, documentUrl);
  //cy.url().should('include', documentUrl)
});

And("Soy dirigido a la pagina de la actividad donde pulso el enlace ??Qu?? es EduCaixa?", () => {
  homeWebElements.WhatIsEduCaixaLink.click({ force: true });
});

And("Soy dirigido a la pagina de la actividad donde pulso el enlace Experiencias", () => {
  homeWebElements.ExperiencesLink.click({ force: true });
});

And("Soy dirigido a la pagina de la actividad donde pulso el enlace Nuestros centros", () => {
  homeWebElements.OurCentersLink.click({ force: true });
});

And("Soy dirigido a la pagina de la actividad donde pulso el enlace Contacto", () => {
  homeWebElements.ContactLink.click({ force: true });
});

Then("Soy dirigido a la pagina {string}", (pagina) => {
  cy.url().should('eq', pagina)
});

And("Los campos estan vacios", () => {
  cy.get('#_EducaixaFormularios_INSTANCE_rSEAPPhhH2wK_name')
    .invoke('val')
    .then(inputtext =>
      assert.equal(inputtext, '')
    );
});

And("Los campos debrian contener los valores del usuario {string}", (email) => {
  cy.get('#_EducaixaFormularios_INSTANCE_rSEAPPhhH2wK_email')
    .invoke('val')
    .then(inputtext =>
      assert.equal(inputtext, email)
    );
});

Then("Se muestra el enlace de Mas informaci??n", () => {
  activityRoamingCardWebElements.ActivityRoamingCardMoreInfoLabel.should('be.visible').should('not.be.empty');
});

Then("Se muestra el boton de Reserva", () => {
  activityRoamingCardWebElements.ActivityRoamingCardPreOrdeButton.should('be.visible');
});

And("Pulso el enlace de Mas informaci??n", () => {
  activityRoamingCardWebElements.ActivityRoamingCardMoreInfoLabel.click();
});

Then("Se muestra un pop-up con informaci??n de la actividad", () => {
  activityRoamingCardWebElements.ActivityRoamingCardMoreInfoPopUp.should('be.visible').should('not.be.empty');
});

And("Pulso el bot??n Reservar", () => {
  activityCardWebElements.ActivityCardTitle.should('be.visible');
  activityRoamingCardWebElements.ActivityRoamingCardPreOrdeButton.invoke('removeAttr', 'target');
  activityRoamingCardWebElements.ActivityRoamingCardPreOrdeButton.click();
});

Then("Soy dirigido a una pagina con informacion sobre la actividad {string}", (url) => {
  cy.url().should('eq', url)
});

