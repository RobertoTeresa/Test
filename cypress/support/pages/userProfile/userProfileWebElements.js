class userProfileWebElements {
   get UserProfileMenuMyProfile() { return cy.get('#_com_educaixa_user_profile_EducaixaUserProfilePortlet_tabs210912145112114111102105108101TabsId > .nav-link')}
   get UserProfileMyProfilePreferences() { return cy.get('#preferencias')}
   get UserProfileMyProfileActivity() { return cy.get('#actividades')}
   get UserProfileMyProfileActivityList() { return cy.get(':nth-child(4) > :nth-child(1) > .mod-filtros-landings__resultados')}
   get UserProfileMyProfileCenterSelectedButton() { return cy.get('.center__button_checked')}
   get UserProfileMyProfileCenterSelectedList () { return cy.get('.description__wrapper')}
}

export default new userProfileWebElements();      