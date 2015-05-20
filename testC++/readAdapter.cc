#include <node.h>
#include <nan.h>
#include <iostream>
#include "../examples/read.cc"

NAN_METHOD(returnValue) {
  NanScope();
  int answer = args[0]->Uint32Value();
  NanReturnValue(NanNew<v8::Number>(answer));
}

void Init(v8::Handle<v8::Object> target) {
    target->Set(
          NanNew<v8::String>("returnValue")
        , NanNew<v8::FunctionTemplate>(returnValue)->GetFunction()
      );
}

NODE_MODULE(read, Init)