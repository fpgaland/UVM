`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: MC_MULT
// Function: Multi clock multiplier
//////////////////////////////////////////////////////////////////////////////////


module MC_MULT #(
    parameter P_BW_A = 8,                               /* Bit width of A_IN. P_BW_A+1 clocks needed for calculation */
    parameter P_BW_B = 8                                /* Bit width of B_IN */
) (
    input  wire                         CLK,
    input  wire                         RST,            /* Active high */
    input  wire [P_BW_A - 1:0]          A_IN,
    input  wire [P_BW_B - 1:0]          B_IN,
    input  wire                         START,          /* Caluculation start */
    output wire [P_BW_A + P_BW_B - 1:0] MULT_OUT,       /* Multiply result. This value is valid when VALID==1'b1 */
    output reg                          VALID           /* Result valid. 1 clock pulse */
);

/********************************************************************************/
/**** Functions *****************************************************************/
/********************************************************************************/
function integer min_bw (input integer n);    /* Minimum required bit width for n */
    integer cnt;
    integer n_shift;
begin    
    cnt = 0;
    n_shift = n;

    while (n_shift > 0) begin
        n_shift = n_shift >> 1;
        cnt = cnt + 1;
    end
    
    min_bw = cnt;
end
endfunction

/********************************************************************************/
/**** Local parameters **********************************************************/
/********************************************************************************/

localparam                  P_BW_CNT = min_bw(P_BW_A - 1);
localparam [P_BW_CNT - 1:0] P_CNT_MAX = P_BW_A - 1;


/********************************************************************************/
/**** Signals *******************************************************************/
/********************************************************************************/

/* Rising edge of START*/
reg                                     start_ff1;
wire                                    start_redg;

/* Caluculation running */
reg                                     calc_running;

/* Counter */
reg  [P_BW_CNT - 1:0]                   counter;

/* Latch input data and shif */
reg  [P_BW_A + P_BW_B - 1:0]            a_lat;
reg  [P_BW_A + P_BW_B - 1:0]            b_lat;

/* Accumlator */
reg  [P_BW_A + P_BW_B - 1:0]            accumlator;


/********************************************************************************/
/**** Behaviour *****************************************************************/
/********************************************************************************/

/* Rising edge of START*/
always @ (posedge CLK or posedge RST) begin
    if (RST) begin
        start_ff1   <=  1'b0;
    end else begin
        start_ff1   <=  START;
    end
end

assign start_redg = START & (~start_ff1);


/* Caluculation running */
always @ (posedge CLK or posedge RST) begin
    if (RST) begin
        calc_running   <=  1'b0;
    end else begin
        if (start_redg == 1'b1) begin
            calc_running   <=  1'b1;
        end else begin
            if (VALID == 1'b1) begin
                calc_running   <=  1'b0;
            end else begin
                calc_running   <=  calc_running;
            end
        end
    end
end


/* Counter */
always @ (posedge CLK or posedge RST) begin
    if (RST) begin
        counter   <=  'd0;
    end else begin
        if (calc_running == 1'b1) begin
            if (counter <= P_CNT_MAX) begin
                counter <=  counter + 1'b1;
            end else begin
                counter <=  'd0;
            end
        end else begin
            counter <=  'd0;
        end
    end
end


/* Valid signal */
always @ (posedge CLK or posedge RST) begin
    if (RST) begin
        VALID   <=  1'b0;
    end else begin
        if ((calc_running == 1'b1) && (counter == P_CNT_MAX)) begin
            VALID   <=  1'b1;
        end else begin
            VALID   <=  1'b0;
        end
    end
end


/* Latch input data A and shift */
always @ (posedge CLK or posedge RST) begin
    if (RST) begin
        a_lat   <=  'd0;
    end else begin
        if (calc_running == 1'b1) begin
            a_lat   <=  a_lat >> 1;
        end else begin
            if (start_redg == 1'b1) begin
                a_lat   <=  A_IN;
            end else begin
                a_lat   <=  'd0;
            end
        end
    end
end


/* Latch input data B and shift */
always @ (posedge CLK or posedge RST) begin
    if (RST) begin
        b_lat   <=  'd0;
    end else begin
        if (calc_running == 1'b1) begin
            b_lat   <=  b_lat << 1;       /* This is correct */
//            b_lat   <=  b_lat >> 1;       /* This is miss cording */
        end else begin
            if (start_redg == 1'b1) begin
                b_lat   <=  B_IN;
            end else begin
                b_lat   <=  'd0;
            end
        end
    end
end


/* Accumlator */
always @ (posedge CLK or posedge RST) begin
    if (RST) begin
        accumlator   <=  'd0;
    end else begin
        if (calc_running == 1'b1) begin
            if (a_lat[0] == 1'b1) begin
                accumlator  <=  accumlator + b_lat;
            end else begin
                accumlator  <=  accumlator;
            end
        end else begin
            accumlator   <=  'd0;
        end
    end
end


/* Result output */
assign MULT_OUT    =  accumlator;


endmodule
