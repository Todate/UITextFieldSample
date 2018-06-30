//
//  MainViewController.swift
//  UITextFieldSample
//
//  Created by Daisuke Todate on 2018/06/24.
//  Copyright © 2018年 Daisuke Todate. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        initTextField()
    }

    private func initTextField() {
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .default
        textField.spellCheckingType = .default
        textField.keyboardType = .default
        textField.keyboardAppearance = .default
        textField.returnKeyType = .default
        textField.enablesReturnKeyAutomatically = false
        textField.isSecureTextEntry = false

        if #available(iOS 10.0, *) {
            textField.textContentType = nil
        }

        if #available(iOS 11.0, *) {
            textField.smartDashesType = .default
            textField.smartInsertDeleteType = .default
            textField.smartQuotesType = .default
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cell = tableView.cellForRow(at: indexPath)

        switch indexPath.row {
        case 0:
            contentTypeCellTapped(cell: cell)
        case 1:
            capitalizationCellTapped(cell: cell)
        case 2:
            correctionCellTapped(cell: cell)
        case 3:
            smartDashesCellTapped(cell: cell)
        case 4:
            smartInsertCellTapped(cell: cell)
        case 5:
            smartQuotesCellTapped(cell: cell)
        case 6:
            spellCheckingCellTapped(cell: cell)
        case 7:
            keyboardTypeCellTapped(cell: cell)
        case 8:
            keyboardLookCellTapped(cell: cell)
        case 9:
            returnKeyCellTapped(cell: cell)
        case 10:
            autoEnableReturnKeyCellTapped(cell: cell)
        case 11:
            secureTextEntryCellTapped(cell: cell)
        default:
            break
        }
    }

    private func showAvailableAlert(ver: String, target: String) {
        UIAlertController(title: "iOS \(ver) or Newer", message: "\(target) is only available on iOS \(ver) or newer", preferredStyle: .alert)
            .addAction(title: "OK", style: .default)
            .show()
    }

    private func contentTypeCellTapped(cell: UITableViewCell?) {
        if #available(iOS 10.0, *) {
            UIAlertController(title: "Content Type", message: "Use this property to give the keyboard and the system information about the expected semantic meaning for the content that users enter.", preferredStyle: .actionSheet)
                .addAction(title: "Unspecified", style: .default, handler: { _ in
                    self.textField.textContentType = nil
                    cell?.detailTextLabel?.text = "Unspecified"
                })
                .addAction(title: "Name", style: .default, handler: { _ in
                    self.textField.textContentType = .name
                    cell?.detailTextLabel?.text = "Name"
                })
                .addAction(title: "Name Prefix", style: .default, handler: { _ in
                    self.textField.textContentType = .namePrefix
                    cell?.detailTextLabel?.text = "Name Prefix"
                })
                .addAction(title: "Given Name", style: .default, handler: { _ in
                    self.textField.textContentType = .givenName
                    cell?.detailTextLabel?.text = "Given Name"
                })
                .addAction(title: "Middle Name", style: .default, handler: { _ in
                    self.textField.textContentType = .middleName
                    cell?.detailTextLabel?.text = "Middle Name"
                })
                .addAction(title: "Family Name", style: .default, handler: { _ in
                    self.textField.textContentType = .familyName
                    cell?.detailTextLabel?.text = "Family Name"
                })
                .addAction(title: "Name Suffix", style: .default, handler: { _ in
                    self.textField.textContentType = .nameSuffix
                    cell?.detailTextLabel?.text = "Name Suffix"
                })
                .addAction(title: "Nickname", style: .default, handler: { _ in
                    self.textField.textContentType = .nickname
                    cell?.detailTextLabel?.text = "Nickname"
                })
                .addAction(title: "Job Title", style: .default, handler: { _ in
                    self.textField.textContentType = .jobTitle
                    cell?.detailTextLabel?.text = "Job Title"
                })
                .addAction(title: "Organization Name", style: .default, handler: { _ in
                    self.textField.textContentType = .organizationName
                    cell?.detailTextLabel?.text = "Organization Name"
                })
                .addAction(title: "Location", style: .default, handler: { _ in
                    self.textField.textContentType = .location
                    cell?.detailTextLabel?.text = "Location"
                })
                .addAction(title: "Full Street Address", style: .default, handler: { _ in
                    self.textField.textContentType = .fullStreetAddress
                    cell?.detailTextLabel?.text = "Full Street Address"
                })
                .addAction(title: "Street Address Line 1", style: .default, handler: { _ in
                    self.textField.textContentType = .streetAddressLine1
                    cell?.detailTextLabel?.text = "Street Address Line 1"
                })
                .addAction(title: "Street Address Line 2", style: .default, handler: { _ in
                    self.textField.textContentType = .streetAddressLine2
                    cell?.detailTextLabel?.text = "Street Address Line 2"
                })
                .addAction(title: "City", style: .default, handler: { _ in
                    self.textField.textContentType = .addressCity
                    cell?.detailTextLabel?.text = "City"
                })
                .addAction(title: "State", style: .default, handler: { _ in
                    self.textField.textContentType = .addressState
                    cell?.detailTextLabel?.text = "State"
                })
                .addAction(title: "City and State", style: .default, handler: { _ in
                    self.textField.textContentType = .addressCityAndState
                    cell?.detailTextLabel?.text = "Name"
                })
                .addAction(title: "Sublocality", style: .default, handler: { _ in
                    self.textField.textContentType = .sublocality
                    cell?.detailTextLabel?.text = "Sublocality"
                })
                .addAction(title: "Country Name", style: .default, handler: { _ in
                    self.textField.textContentType = .countryName
                    cell?.detailTextLabel?.text = "Country Name"
                })
                .addAction(title: "Postal Code", style: .default, handler: { _ in
                    self.textField.textContentType = .postalCode
                    cell?.detailTextLabel?.text = "Postal Code"
                })
                .addAction(title: "Telephone Number", style: .default, handler: { _ in
                    self.textField.textContentType = .telephoneNumber
                    cell?.detailTextLabel?.text = "Telephone Number"
                })
                .addAction(title: "Email Address", style: .default, handler: { _ in
                    self.textField.textContentType = .emailAddress
                    cell?.detailTextLabel?.text = "Email Address"
                })
                .addAction(title: "URL", style: .default, handler: { _ in
                    self.textField.textContentType = .URL
                    cell?.detailTextLabel?.text = "URL"
                })
                .addAction(title: "Credit Card Number", style: .default, handler: { _ in
                    self.textField.textContentType = .creditCardNumber
                    cell?.detailTextLabel?.text = "Credit Card Number"
                })
                .addAction(title: "Username", style: .default, handler: { _ in
                    if #available(iOS 11.0, *) {
                        self.textField.textContentType = .username
                        cell?.detailTextLabel?.text = "Username"
                    } else {
                        self.showAvailableAlert(ver: "11.0", target: "Username")
                    }
                })
                .addAction(title: "Password", style: .default, handler: { _ in
                    if #available(iOS 11.0, *) {
                        self.textField.textContentType = .password
                        cell?.detailTextLabel?.text = "Password"
                    } else {
                        self.showAvailableAlert(ver: "11.0", target: "Password")
                    }
                })
                .addAction(title: "Cancel", style: .cancel)
                .show()
        } else {
            showAvailableAlert(ver: "10.0", target: "Content Type")
        }
    }

    private func capitalizationCellTapped(cell: UITableViewCell?) {
        UIAlertController(title: "Capitalization", message: "This property determines at what times the Shift key is automatically pressed, thereby making the typed character a capital letter.", preferredStyle: .actionSheet)
            .addAction(title: "None", style: .default, handler: { _ in
                self.textField.autocapitalizationType = .none
                cell?.detailTextLabel?.text = "None"
            })
            .addAction(title: "Words", style: .default, handler: { _ in
                self.textField.autocapitalizationType = .words
                cell?.detailTextLabel?.text = "Words"
            })
            .addAction(title: "Sentences", style: .default, handler: { _ in
                self.textField.autocapitalizationType = .sentences
                cell?.detailTextLabel?.text = "Sentences"
            })
            .addAction(title: "All Characters", style: .default, handler: { _ in
                self.textField.autocapitalizationType = .allCharacters
                cell?.detailTextLabel?.text = "All Characters"
            })
            .addAction(title: "Cancel", style: .cancel)
            .show()
    }

    private func correctionCellTapped(cell: UITableViewCell?) {
        UIAlertController(title: "Correction", message: "This property determines whether autocorrection is enabled or disabled during typing. With autocorrection enabled, the text object tracks unknown words and suggests a more suitable replacement candidate to the user, replacing the typed text automatically unless the user explicitly overrides the action.", preferredStyle: .actionSheet)
            .addAction(title: "Default", style: .default, handler: { _ in
                self.textField.autocorrectionType = .default
                cell?.detailTextLabel?.text = "Default"
            })
            .addAction(title: "No", style: .default, handler: { _ in
                self.textField.autocorrectionType = .no
                cell?.detailTextLabel?.text = "No"
            })
            .addAction(title: "Yes", style: .default, handler: { _ in
                self.textField.autocorrectionType = .yes
                cell?.detailTextLabel?.text = "Yes"
            })
            .addAction(title: "Cancel", style: .cancel)
            .show()
    }

    private func smartDashesCellTapped(cell: UITableViewCell?) {
        if #available(iOS 11.0, *) {
            UIAlertController(title: "Smart Dashes", message: "Use this property to configure whether UIKit converts two hyphens into an en-dash and three hyphens into an em-dash automatically.", preferredStyle: .actionSheet)
                .addAction(title: "Default", style: .default, handler: { _ in
                    self.textField.smartDashesType = .default
                    cell?.detailTextLabel?.text = "Default"
                })
                .addAction(title: "No", style: .default, handler: { _ in
                    self.textField.smartDashesType = .no
                    cell?.detailTextLabel?.text = "No"
                })
                .addAction(title: "Yes", style: .default, handler: { _ in
                    self.textField.smartDashesType = .yes
                    cell?.detailTextLabel?.text = "Yes"
                })
                .addAction(title: "Cancel", style: .cancel)
                .show()
        } else {
            showAvailableAlert(ver: "11.0", target: "Smart Dashes")
        }
    }

    private func smartInsertCellTapped(cell: UITableViewCell?) {
        if #available(iOS 11.0, *) {
            UIAlertController(title: "Smart Insert Delete", message: "Use this property to configure whether UIKit may insert an extra space after a paste operation or delete one or two spaces after a cut or delete operation.", preferredStyle: .actionSheet)
                .addAction(title: "Default", style: .default, handler: { _ in
                    self.textField.smartInsertDeleteType = .default
                    cell?.detailTextLabel?.text = "Default"
                })
                .addAction(title: "No", style: .default, handler: { _ in
                    self.textField.smartInsertDeleteType = .no
                    cell?.detailTextLabel?.text = "No"
                })
                .addAction(title: "Yes", style: .default, handler: { _ in
                    self.textField.smartInsertDeleteType = .yes
                    cell?.detailTextLabel?.text = "Yes"
                })
                .addAction(title: "Cancel", style: .cancel)
                .show()
        } else {
            showAvailableAlert(ver: "11.0", target: "Smart Insert")
        }
    }

    private func smartQuotesCellTapped(cell: UITableViewCell?) {
        if #available(iOS 11.0, *) {
            UIAlertController(title: "Smart Quotes", message: "Use this property to configure whether UIKit replaces straight apostrophes and quotation marks with region-specific glyphs.", preferredStyle: .actionSheet)
                .addAction(title: "Default", style: .default, handler: { _ in
                    self.textField.smartQuotesType = .default
                    cell?.detailTextLabel?.text = "Default"
                })
                .addAction(title: "No", style: .default, handler: { _ in
                    self.textField.smartQuotesType = .no
                    cell?.detailTextLabel?.text = "No"
                })
                .addAction(title: "Yes", style: .default, handler: { _ in
                    self.textField.smartQuotesType = .yes
                    cell?.detailTextLabel?.text = "Yes"
                })
                .addAction(title: "Cancel", style: .cancel)
                .show()
        } else {
            showAvailableAlert(ver: "11.0", target: "Smart Quotes")
        }
    }

    private func spellCheckingCellTapped(cell: UITableViewCell?) {
        UIAlertController(title: "Spell Checking", message: "This property determines whether spell-checking is enabled or disabled during typing. With spell-checking enabled, the text object generates red underlines for all misspelled words. If the user taps on a misspelled word, the text object presents the user with a list of possible corrections.", preferredStyle: .actionSheet)
            .addAction(title: "Default", style: .default, handler: { _ in
                self.textField.spellCheckingType = .default
                cell?.detailTextLabel?.text = "Default"
            })
            .addAction(title: "No", style: .default, handler: { _ in
                self.textField.spellCheckingType = .no
                cell?.detailTextLabel?.text = "No"
            })
            .addAction(title: "Yes", style: .default, handler: { _ in
                self.textField.spellCheckingType = .yes
                cell?.detailTextLabel?.text = "Yes"
            })
            .addAction(title: "Cancel", style: .cancel)
            .show()
    }

    private func keyboardTypeCellTapped(cell: UITableViewCell?) {
        UIAlertController(title: "Keyboard Type", message: "Text objects can be targeted for specific types of input, such as plain text, email, numeric entry, and so on. The keyboard style identifies what keys are available on the keyboard and which ones appear by default.", preferredStyle: .actionSheet)
            .addAction(title: "Default", style: .default, handler: { _ in
                self.textField.keyboardType = .default
                cell?.detailTextLabel?.text = "Default"
            })
            .addAction(title: "ASCII Capable", style: .default, handler: { _ in
                self.textField.keyboardType = .asciiCapable
                cell?.detailTextLabel?.text = "ASCII Capable"
            })
            .addAction(title: "Numbers and Punctuation", style: .default, handler: { _ in
                self.textField.keyboardType = .numbersAndPunctuation
                cell?.detailTextLabel?.text = "Numbers and Punctuation"
            })
            .addAction(title: "URL", style: .default, handler: { _ in
                self.textField.keyboardType = .URL
                cell?.detailTextLabel?.text = "URL"
            })
            .addAction(title: "Number Pad", style: .default, handler: { _ in
                self.textField.keyboardType = .numberPad
                cell?.detailTextLabel?.text = "Number Pad"
            })
            .addAction(title: "Phone Pad", style: .default, handler: { _ in
                self.textField.keyboardType = .phonePad
                cell?.detailTextLabel?.text = "Phone Pad"
            })
            .addAction(title: "Name Phone Pad", style: .default, handler: { _ in
                self.textField.keyboardType = .namePhonePad
                cell?.detailTextLabel?.text = "Name Phone Pad"
            })
            .addAction(title: "E-mail Address", style: .default, handler: { _ in
                self.textField.keyboardType = .emailAddress
                cell?.detailTextLabel?.text = "E-mail Address"
            })
            .addAction(title: "Decimal Pad", style: .default, handler: { _ in
                self.textField.keyboardType = .decimalPad
                cell?.detailTextLabel?.text = "Decimal Pad"
            })
            .addAction(title: "Twitter", style: .default, handler: { _ in
                self.textField.keyboardType = .twitter
                cell?.detailTextLabel?.text = "Twitter"
            })
            .addAction(title: "Web Search", style: .default, handler: { _ in
                self.textField.keyboardType = .webSearch
                cell?.detailTextLabel?.text = "Web Search"
            })
            .addAction(title: "ASCII Capable Number Pad", style: .default, handler: { _ in
                if #available(iOS 10.0, *) {
                    self.textField.keyboardType = .asciiCapableNumberPad
                    cell?.detailTextLabel?.text = "ASCII Capable Number Pad"
                } else {
                    self.showAvailableAlert(ver: "10.0", target: "ASCII Capable Number Pad")
                }
            })
            .addAction(title: "Cancel", style: .cancel)
            .show()
    }

    private func keyboardLookCellTapped(cell: UITableViewCell?) {
        UIAlertController(title: "Keyboard Look", message: "This property lets you distinguish between the default text entry inside your application and text entry inside an alert panel.", preferredStyle: .actionSheet)
            .addAction(title: "Default", style: .default, handler: { _ in
                self.textField.keyboardAppearance = .default
                cell?.detailTextLabel?.text = "Default"
            })
            .addAction(title: "Dark", style: .default, handler: { _ in
                self.textField.keyboardAppearance = .dark
                cell?.detailTextLabel?.text = "Dark"
            })
            .addAction(title: "Light", style: .default, handler: { _ in
                self.textField.keyboardAppearance = .light
                cell?.detailTextLabel?.text = "Light"
            })
            .addAction(title: "Cancel", style: .cancel)
            .show()
    }

    private func returnKeyCellTapped(cell: UITableViewCell?) {
        UIAlertController(title: "Return Key", message: "Setting this property to a different key type changes the visible title of the Return key and typically results in the keyboard being dismissed when it is pressed.", preferredStyle: .actionSheet)
            .addAction(title: "Default", style: .default, handler: { _ in
                self.textField.returnKeyType = .default
                cell?.detailTextLabel?.text = "Default"
            })
            .addAction(title: "Go", style: .default, handler: { _ in
                self.textField.returnKeyType = .go
                cell?.detailTextLabel?.text = "Go"
            })
            .addAction(title: "Google", style: .default, handler: { _ in
                self.textField.returnKeyType = .google
                cell?.detailTextLabel?.text = "Google"
            })
            .addAction(title: "Join", style: .default, handler: { _ in
                self.textField.returnKeyType = .join
                cell?.detailTextLabel?.text = "Join"
            })
            .addAction(title: "Next", style: .default, handler: { _ in
                self.textField.returnKeyType = .next
                cell?.detailTextLabel?.text = "Next"
            })
            .addAction(title: "Route", style: .default, handler: { _ in
                self.textField.returnKeyType = .route
                cell?.detailTextLabel?.text = "Route"
            })
            .addAction(title: "Search", style: .default, handler: { _ in
                self.textField.returnKeyType = .search
                cell?.detailTextLabel?.text = "Search"
            })
            .addAction(title: "Send", style: .default, handler: { _ in
                self.textField.returnKeyType = .send
                cell?.detailTextLabel?.text = "Send"
            })
            .addAction(title: "Yahoo", style: .default, handler: { _ in
                self.textField.returnKeyType = .yahoo
                cell?.detailTextLabel?.text = "Yahoo"
            })
            .addAction(title: "Done", style: .default, handler: { _ in
                self.textField.returnKeyType = .done
                cell?.detailTextLabel?.text = "Done"
            })
            .addAction(title: "Emergency Call", style: .default, handler: { _ in
                self.textField.returnKeyType = .emergencyCall
                cell?.detailTextLabel?.text = "Emergency Call"
            })
            .addAction(title: "Continue", style: .default, handler: { _ in
                self.textField.returnKeyType = .continue
                cell?.detailTextLabel?.text = "Continue"
            })
            .addAction(title: "Cancel", style: .cancel)
            .show()
    }

    private func autoEnableReturnKeyCellTapped(cell: UITableViewCell?) {
        UIAlertController(title: "Auto-enable Return Key", message: "A Boolean value indicating whether the Return key is automatically enabled when the user is entering text.", preferredStyle: .actionSheet)
            .addAction(title: "true", style: .default, handler: { _ in
                self.textField.enablesReturnKeyAutomatically = true
                cell?.detailTextLabel?.text = "true"
            })
            .addAction(title: "false", style: .default, handler: { _ in
                self.textField.enablesReturnKeyAutomatically = false
                cell?.detailTextLabel?.text = "false"
            })
            .addAction(title: "Cancel", style: .cancel)
            .show()
    }

    private func secureTextEntryCellTapped(cell: UITableViewCell?) {
        UIAlertController(title: "Secure Text Entry", message: "Identifies whether the text object should disable text copying and in some cases hide the text being entered.", preferredStyle: .actionSheet)
            .addAction(title: "true", style: .default, handler: { _ in
                self.textField.isSecureTextEntry = true
                cell?.detailTextLabel?.text = "true"
            })
            .addAction(title: "false", style: .default, handler: { _ in
                self.textField.isSecureTextEntry = false
                cell?.detailTextLabel?.text = "false"
            })
            .addAction(title: "Cancel", style: .cancel)
            .show()
    }
}
