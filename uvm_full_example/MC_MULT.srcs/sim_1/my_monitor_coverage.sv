`ifndef MY_MONITOR_COVERAGE
`define MY_MONITOR_COVERAGE


class my_monitor_coverage extends my_monitor;

    bit coverage_enable = 1'b1;

    /* Define cover group */
    covergroup cg with function sample(
        bit[`BW_A - 1:0] a_in,
        bit[`BW_B - 1:0] b_in
    );
        coverpoint a_in { bins a_value[] = { [1 : 200] };}
        coverpoint b_in { bins b_value[] = { [1 : 10] };}
    endgroup

    `uvm_component_utils_begin(my_monitor_coverage)
        `uvm_field_int(coverage_enable, UVM_DEFAULT)
    `uvm_component_utils_end

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
        cg = new;       /* Create an instance */
    endfunction

    /* Override write() */
    function void write(my_item data);
        super.write(data);

        if (coverage_enable) cg.sample(data.a_in, data.b_in);   /* Coverage collection */
    endfunction
    
endclass

`endif
