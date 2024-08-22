
# MTC-Fakecards
MTC-Fakecards is a script designed to give the players a possibility to fake their identity card or drivers license. It gives the player a random firstname, lastname and dob. It chosses the players new identity on a random list that can be found and changed in: `config/names.lua`.

## Our links
- [Discord](https://discord.gg/APFHf9hhkG)
- [Tebex (Paid scripts)](https://mtc.tebex.io/)

### How to use it?
1. Clone the repository
2. Rename the folder to `mtc-fakecards`
3. Add the following [code](https://pastebin.com/0p2zz2jY) to `qbx_idcard/bridge/framework/qbox.lua`
4. Configure your config in: `config/config.lua`
5. Start the script

### Dependencies
- [ox_lib](https://github.com/overextended/ox_lib)
- [qbx_core](https://github.com/Qbox-project/qbx_core)
- [qbx_idcard](https://github.com/Qbox-project/qbx_idcard)

### Support
MTC-Fakecards currently only supports the qbox framework with qbx_idcard. In the future we will look into support for ESX and other ID Card scripts.

### How to change the locale?
In MTC-fakecards we are using [ox_lib locale system](https://overextended.dev/ox_lib/Modules/Locale/Shared#:~:text=locales/langcode.json-,Setup,-To%20change%20the). The basic value will be english. To add other languages copy the preset: en.json and rename it to you `langcode.json` and translate the value.

### Previews
![image](https://github.com/user-attachments/assets/730a733b-3ada-462c-9975-3b2f0363d66d)
![image](https://github.com/user-attachments/assets/0451cb51-0959-41e0-99d6-48c9e14f922d)

## 👉 Join our community

[![Discord](https://discord.com/api/guilds/1075048579758035014/widget.png?style=banner2)](https://discord.gg/cFuv5BMWzK)
