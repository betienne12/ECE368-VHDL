--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:41:24 04/08/2016
-- Design Name:   
-- Module Name:   Z:/368/UMDRISC_P1-master1/UMDRISC_P1-master/UMDRISC/Write_back_tb.vhd
-- Project Name:  UMDRISC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WriteBack
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Write_back_tb IS
END Write_back_tb;
 
ARCHITECTURE behavior OF Write_back_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WriteBack
    PORT(
         clk : IN  std_logic;
         execute_alu_out_latch : IN  std_logic_vector(15 downto 0);
         execute_ldst_out_latch : IN  std_logic_vector(15 downto 0);
         en_Writeback : IN  std_logic;
         Write_back : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal execute_alu_out_latch : std_logic_vector(15 downto 0) := (others => '0');
   signal execute_ldst_out_latch : std_logic_vector(15 downto 0) := (others => '0');
   signal en_Writeback : std_logic := '0';

 	--Outputs
   signal Write_back : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WriteBack PORT MAP (
          clk => clk,
          execute_alu_out_latch => execute_alu_out_latch,
          execute_ldst_out_latch => execute_ldst_out_latch,
          en_Writeback => en_Writeback,
          Write_back => Write_back
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
execute_alu_out_latch <= "0000000000001000";
execute_ldst_out_latch <= "0000000000000000";
      -- insert stimulus here 
		assert (op = "0000")  report "Failed op" ;
		assert (RA = "0000")  report "Failed RA" ;
		assert (RB = "0000")  report "Failed RB" ;
		assert (Write_back = "0000000000001000")  report "Failed Imm" ;

		wait for clk_period*10;
		inst <= "0001001000110100";
		
		assert (op = "0001")  report "Failed op" ;
		assert (RA = "0010")  report "Failed RA" ;
		assert (RB = "0011")  report "Failed RB" ;
		assert (Imm = "0100")  report "Failed Imm" ;
		
   

      -- insert stimulus here 

      wait;
   end process;

END;
