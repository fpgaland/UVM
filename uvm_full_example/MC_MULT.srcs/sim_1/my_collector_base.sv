`ifndef MY_COLLECTOR_BASE
`define MY_COLLECTOR_BASE


class my_collector_base #(type TR = uvm_seqeuence_item) extends uvm_component;

    VIF_COLLECTOR               vif;
    uvm_analysis_port #(TR)     analysis_port;

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_port = new("analysis_port", this);
    endfunction

    /* Connect phase */
    function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);

        if (!uvm_config_db #(VIF_COLLECTOR)::get(this, get_full_name(), "vif", vif))
            `uvm_error("VIF_NOT_SET", {"No interface assigned to ", get_full_name(), ".vif"});
    endfunction
    
    /* Run phase */
    task run_phase(uvm_phase phase);
        collect_response();
    endtask

    /* Sub class must implement this behaviour */
    virtual task collect_response(); endtask

endclass

`endif
