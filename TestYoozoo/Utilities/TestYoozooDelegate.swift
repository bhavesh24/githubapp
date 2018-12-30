
import Foundation

protocol testYoozooDelegate: class {
    func sucessMessage(message: String?)
    func failMessage(message: String?)
    func UserInfo(userInfo: UserInfo?)
    func UserInfo(userInfo: [Items]?)
    func UserDetails(userDetails: UserDetails?)
}

extension testYoozooDelegate {
    func sucessMessage(message: String?){}
    func failMessage(message: String?){}
    func UserInfo(userInfo: UserInfo?){}
    func UserInfo(userInfo: [Items]?){}
    func UserDetails(userDetails: UserDetails?){}
}

