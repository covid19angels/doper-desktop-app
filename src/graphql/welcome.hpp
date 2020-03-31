//  To parse this JSON data, first install
//
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     Hello data = nlohmann::json::parse(jsonString);

#pragma once

#include <nlohmann/json.hpp>

namespace quicktype {
    using nlohmann::json;
    struct Hello {
        std::string greeting;
        std::vector<std::string> instructions;
    };
    void from_json(const json & j, Hello& x) {
        x.greeting = j.at("greeting").get<std::string>();
        x.instructions = j.at("instructions").get<std::vector<std::string>>();
    }

    void to_json(json & j, const Hello & x) {
        j = json::object();
        j["greeting"] = x.greeting;
        j["instructions"] = x.instructions;
    }
    struct people {
        std::string name;
        int age;
    };
    void from_json(const json & j, people& x) {
        x.name = j.at("name").get<std::string>();
        x.age = j.at("age").get<int>();
    }

    void to_json(json & j, const people & x) {
        j = json::object();
        j["name"] = x.name;
        j["age"] = x.age;
    }
}


/*

std::string  welStr = R"(
    {
      "greeting": "Welcome to quicktype!",
      "instructions": [
        "Type or paste JSON here",
        "Or choose a sample above",
        "quicktype will generate code in your",
        "chosen language to parse the sample data"
      ]
    })";

quicktype::Hello  data = nlohmann::json::parse(welStr);

//    std::cout << data.greeting   <<std::endl ;
//    for (auto var = data.instructions.begin();var != data.instructions.end();var ++){
//        std::cout << *var <<std::endl;
//    }
std::string  peoStr = R"(
    {
      "name": "zhang ning"
    })";
try {
    quicktype::people pe = nlohmann::json::parse(peoStr);
}catch(nlohmann::json::exception& e){
    //        std::cout << "message: " << e.what() << '\n'
    //        << "exception id: " << e.id << std::endl;
};
 */

