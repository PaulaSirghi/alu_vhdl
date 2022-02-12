----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2021 12:37:43
-- Design Name: 
-- Module Name: ID - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ID is
  Port ( instr: in std_logic_vector(67 downto 0);
        opcode: out std_logic_vector(3 downto 0);
        a: out std_logic_vector(31 downto 0);
        b: out std_logic_vector(31 downto 0) );
end ID;

architecture Behavioral of ID is

begin

opcode<=instr(67 downto 64);
a<=instr(63 downto 32);
b<=instr(31 downto 0);

end Behavioral;
