
import Foundation
import Alamofire

public class Neura {
    private let baseURL: String

    public init(baseURL: String) {
        self.baseURL = baseURL
    }

    public func signUp(email: String, password: String, isOTP: Bool = false, otp: String? = nil, completion: @escaping (String?, Bool, Error?) -> Void) {
        let url = "\(baseURL)/signup"
        var params: [String: Any] = ["email": email, "password": password, "isOTP": isOTP]
        if let otp = otp { params["otp"] = otp }

        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let json = response.value as? [String: Any] {
                    if json["status"] as? String == "otp_required" {
                        completion(nil, true, nil)
                    } else if let token = json["jwt"] as? String {
                        completion(token, false, nil)
                    } else {
                        completion(nil, false, response.error)
                    }
                } else {
                    completion(nil, false, response.error)
                }
            }
    }

    public func signIn(email: String, password: String, isOTP: Bool = false, otp: String? = nil, completion: @escaping (String?, Bool, Error?) -> Void) {
        let url = "\(baseURL)/login"
        var params: [String: Any] = ["email": email, "password": password, "isOTP": isOTP]
        if let otp = otp { params["otp"] = otp }

        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let json = response.value as? [String: Any] {
                    if json["status"] as? String == "otp_required" {
                        completion(nil, true, nil)
                    } else if let token = json["jwt"] as? String {
                        completion(token, false, nil)
                    } else {
                        completion(nil, false, response.error)
                    }
                } else {
                    completion(nil, false, response.error)
                }
            }
