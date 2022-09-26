`ifndef MY_DRIVER
`define MY_DRIVER


class my_driver extends my_driver_base #(my_item);

    `uvm_component_utils(my_driver)

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    /* Get transaction and drive DUT in Run phase */
    task get_drive_item();
        seq_item_port.get_next_item(req);
        drive_item(req);
        seq_item_port.item_done();
    endtask

    /* Drive DUT */
    task drive_item(input REQ item);

        @ (posedge vif.clk);
        vif.rst     <=  item.rst;

        @ (posedge vif.clk);
        vif.a_in    <=  item.a_in;
        vif.b_in    <=  item.b_in;
        vif.start   <=  1'b1;

        @ (posedge vif.clk);
        vif.start   <=  1'b0;

        for (int i = 0; i < `BW_A; i++)
             @ (posedge vif.clk);
             
    endtask
    
endclass

`endif
