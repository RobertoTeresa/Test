import userProfileWebElements from "./userProfileWebElements";
class userProfilePage {
    urlProfile="https://pre.educaixa.org/es/myeducaixa"

    changePreferenceCenter(centro) {
        userProfileWebElements.UserProfileMenuMyProfile.click();
        userProfileWebElements.UserProfileMyProfilePreferences.click();
        userProfileWebElements.UserProfileMyProfileCenterSelectedList.find('span').contains(centro).click();
    }

    checkPreferenceCenter(centro) {
        userProfileWebElements.UserProfileMenuMyProfile.click();
        userProfileWebElements.UserProfileMyProfilePreferences.click();
        userProfileWebElements.UserProfileMyProfileCenterSelectedList.find('button').contains(centro).parent().should('have.class','center__button_checked');
    }
}
export default new userProfilePage();                  