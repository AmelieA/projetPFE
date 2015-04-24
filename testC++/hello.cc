#include <node.h>
#include <v8.h>
#include <stdio.h>
#include <string.h>
#include <cstdio>

using namespace v8;

struct product {
  int weight;
  double price;
};

//all javascript callable method must be declared as follow : Handle<Value> MethodName(const Arguments& args);
//Always declare a local HandleScope
//Always return using the Close clause

//Handle<Value> getFruit(const Arguments& args) {
//  HandleScope scope;
////v8::EscapableHandleScope scope();
//
////  char *arg;
//  v8::String::Utf8Value str(args[0]->ToString()); //String of the first argument
////  arg = *str;
//
//  product fruit;
//  if (args[0]->NumberValue() == 1){
//    fruit.weight=1;
//    fruit.price=1;
//    v8::String::Utf8Value str(args[0]->ToString());
//  }else{
//    fruit.weight=99;
//    fruit.price=99;
//     v8::String::Utf8Value str(args[1]->ToString());
//  }
//
////  v8::Local<v8::String> str = args[1]->ToString(); // some string
////  v8::Local<v8::Value> result = v8::JSON::Parse(str);
////  return scope.Escape(result);
//  return scope.Close(String::New(*str));
//}

int factorial(int n)
{
    if (n<=1)
        return(1);
    else
        n=n*factorial(n-1);
    return(n);
}

Handle<Value> getFactorial(const Arguments& args) {
  HandleScope scope;
  int number = args[0]->NumberValue();
  int result = factorial(number);
  std::printf("%i \n", result);
  return scope.Close(String::New("factorial function"));
}


void init(Handle<Object> target) {
//  NODE_SET_METHOD(target, "hello", getFruit);
  NODE_SET_METHOD(target, "factorial", getFactorial);
}
NODE_MODULE(hello, init)