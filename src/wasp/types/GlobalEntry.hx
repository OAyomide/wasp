package wasp.types;

import haxe.io.*;

class GlobalEntry implements Marshaller {

    /**
     * Init is an initializer expression that computes the initial value of the variable
     */
    public var init:Bytes;

    /**
     * Type holds information about the value type and mutability of the variable
     */
    public var type:GlobalVar;

    public function new() {
        
    }

    public function fromWasm(r:BytesInput) {
        type.fromWasm(r);

        // init_expr is delimited by opcode "end" (0x0b)
        init = Module.readInitExpr(r);
    }

    public function toWasm(w:BytesOutput) {
        type.toWasm(w);

        w.write(init);
    }
}