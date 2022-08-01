import activityCardWebElements from "../actividadCard/activityCardWebElements";

class activityCardPage {
    centerFilter(centro) {
        activityCardWebElements.ActivityCardCenterSelector.click();
        activityCardWebElements.ActivityCardCenterList
            .contains(centro)
            .click();
    }
    
}
export default new activityCardPage();                  