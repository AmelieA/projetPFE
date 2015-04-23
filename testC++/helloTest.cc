#include <iostream>
#include <emscripten/bind.h>
//#include "helloTest.h"



struct Price{
    double euro;
    double dollar;
};

struct Product {
  double weight;
  Price price;
};

Product setProduct(Product product, double weight, double dollar, double euro){
    product.weight = weight;
    product.price.dollar = dollar;
    product.price.euro = euro;

    return product;
}

Product getProduct(int id) {

    Product product;
    if (id==1){
        product = setProduct(product, 1, 1.1, 1.1);
        std::cout << "id = 1" << std::endl;
    }else{
        product.weight=999;
        product.price.euro=999.99;
        product.price.dollar=999.88;
        std::cout << "id unknown" << std::endl;
    }

    return product;
}

std::string returnString(std::string string){
    return std::string(string + " hello");
}

using namespace emscripten;

EMSCRIPTEN_BINDINGS(my_module) {

//    value_array<Product>("Product")
//            .element(&Product::weight)
//            .element(&Product::price)
//            ;
    value_object<Product>("Product")
                .field("weight", &Product::weight)
                .field("price", &Product::price)
                ;
    value_object<Price>("Price")
                    .field("euro", &Price::euro)
                    .field("dollar", &Price::dollar)
                    ;
    function("getProduct", &getProduct);
    function("returnString", &returnString);
}