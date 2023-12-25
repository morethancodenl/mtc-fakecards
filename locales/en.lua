local Translations = {
    Menu = {
        ContactPerson = '« Dmity Petrov »',
        BuyItem = 'Buy a Fake %{itemLabel}',
        ItemDescription = 'If you don\'t like your name to be spread among the police, then buy a fake %{itemLabel} for %{price}',
    },
    Input = {
        Firstname = 'Firstname',
        Lastname = 'Lastname',
        TypeDateOfBirth = 'DD-MM-YYYY',
        DateOfBirth = 'Date of Birth',
        Country = 'Country',

        PersonalInformation = 'Personal Information',
        Confirm = 'Submit',
    },
    Progressbar = {
        Forging = 'Forging..'
    },
    Target = {
        Hello = 'What do you want'
    }
}



Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})