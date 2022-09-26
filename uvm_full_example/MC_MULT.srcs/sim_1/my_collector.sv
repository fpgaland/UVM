`ifndef MY_COLLECTOR
`define MY_COLLECTOR


class my_collector extends my_collector_base #(my_item);

    `uvm_component_utils(my_collector)

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    /* Collect response in Run phase */
    task collect_response ();

        my_item data;
        data = my_item::type_id::create("response");

        forever begin
            @(vif.cb) begin
                if (vif.start == 1'b1) begin
                    data.a_in = vif.a_in;
                    data.b_in = vif.b_in;
                    data.rst  = vif.rst;
                end

                if (vif.rst == 1'b0) begin       /* Reset released */
                    if (vif.valid == 1'b1) begin
                        data.mult_out = vif.mult_out;
                        analysis_port.write(data);
                    end
                end
            end
        end
        
    endtask
    
endclass

`endif
