----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2021 17:31:17
-- Design Name: 
-- Module Name: CLK_signal - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLK_signal is
 Port(clock: out std_logic);
end CLK_signal;

architecture Behavioral of CLK_signal is
constant f:integer:=100e6; --100mhz
constant p:time:=100ns/f;

signal clk:std_logic:='1';
begin
clk<=not clk after 20ps;
end Behavioral;
