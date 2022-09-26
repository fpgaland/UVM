`ifndef MY_DRIVER_BASE
`define MY_DRIVER_BASE


virtual class my_driver_base #(type REQ = uvm_sequence_item, type RSP = REQ)
    extends uvm_driver #(REQ, RSP);

    VIF_DRIVER  vif;

    /* Constructor */
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    /* Build phase */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db #(VIF_DRIVER)::get(this, get_full_name(), "vif", vif))
            `uvm_error("VIF_NOT_SET", {"No interface assigned to ", get_full_name(), ".vif"});
    endfunction

    /* Run phase */
    task run_phase (uvm_phase phase);
        forever begin
            get_drive_item();
        end
    endtask

    /* Sub class must implement this behaviour */
    pure virtual task get_drive_item();

endclass

`endif
