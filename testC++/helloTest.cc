#include <iostream>
#include <emscripten/bind.h>
//#include "helloTest.h"

using namespace emscripten;

struct Product {
  double weight;
  double price;
};

Product getProduct(int id) {

    Product product;
    if (id==1){
        product.weight=1;
        product.price=1.1;
        std::cout << "id = 1" << std::endl;
    }else{
        product.weight=999;
        product.price=999.99;
        std::cout << "id unknown" << std::endl;
    }

    return product;
}

std::string returnString(std::string string){
    return std::string(string + " hello");
}

EMSCRIPTEN_BINDINGS(my_module) {

//    value_array<Product>("Product")
//            .element(&Product::weight)
//            .element(&Product::price)
//            ;
    value_object<Product>("Product")
                .field("weight", &Product::weight)
                .field("price", &Product::price)
                ;
    function("getProduct", &getProduct);
    function("returnString", &returnString);
}