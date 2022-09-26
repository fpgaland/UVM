`ifndef MY_ITEM
`define MY_ITEM


class my_item extends my_item_base;            

    `uvm_object_utils(my_item)

    constraint CA { (a_in >= 1) && (a_in <= 200); }
    constraint CB { (b_in >= 1) && (b_in <= 10); }

    function new(string name = "my_item");
        super.new(name);
    endfunction

endclass

`endif
