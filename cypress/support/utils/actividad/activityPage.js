import activityWebElements from "../actividad/activityWebElements";

class activityPage {
  urlActivity = "https://usuario:FA25zL27as@pre.educaixa.org/es/web/guest/landing-actividades"
  //urlActivity = "https://www.educaixa.org/es/landing-actividades";

  visitPageActivity() {
    Cypress.on('uncaught:exception', (err, runnable) => {
      console.log("err :" + err);
      console.log("runnable :" + runnable);
      return false;
    })
    cy.visit(this.urlActivity)
  }

  clickActivity(activityName) {
    activityWebElements.ActivityList
      .find('h3')
      .contains(activityName)
      .click()
  }

  centerFilter(centro, activityName) {
    activityWebElements.ActivityFilterButton.click();
    activityWebElements.ActivityFilterListCenter
      .contains(centro)
      .invoke('index')
      .then(function (index) {
        cy.get('#centroflc-filter-select').select(index)
      })
    cy.wait(400);
    activityWebElements.ActivityList
      .find('h3')
      .contains(activityName)
      .click()
  }



}
export default new activityPage();                  