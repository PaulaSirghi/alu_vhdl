----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2021 11:14:00
-- Design Name: 
-- Module Name: flags - Behavioral
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

entity flags is
 Port ( A: in std_logic_vector(31 downto 0);
        zero: out std_logic; 
        ovf : out std_logic);
end flags;

architecture Behavioral of flags is
signal o,z: std_logic;
begin
process(a)
begin
if A="00000000000000000000000000000000" then
  z<='1';
else z<='0';
end if;
o<=A(0) or A(1)or A(2) or A(3)or A(3)or A(4)or A(5)or A(6)or A(7)or A(8)or A(9)or A(10)or A(11)or A(12)or A(13)or A(14)or A(15)or A(16)or A(17)or A(18)or A(19)or A(20)or A(21)or A(22)or A(23)or A(24)or A(25)or A(26)or A(27)or A(28)or A(29)or A(30)or A(31);
end process;
zero<=z;
ovf<=o;
end Behavioral;
