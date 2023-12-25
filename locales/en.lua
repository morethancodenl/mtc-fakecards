local Translations = {
    Menu = {
        ContactPerson = '« Dmity Petrov »',

        BuyIdCard = 'Buy a Fake ID-Card',
        BuyDriverLicense = 'Buy a Fake Driver License',
        Description = 'If you don\'t like your name to be spread among the police, then buy a fake card for %{price}'
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