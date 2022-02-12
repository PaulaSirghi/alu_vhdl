----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2021 16:30:28
-- Design Name: 
-- Module Name: shift - Behavioral
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

entity shift is
  Port ( x: in std_logic_vector(63 downto 0);
         dr: in std_logic;
         en: in std_logic;
         y: out std_logic_vector(63 downto 0));
end shift;

architecture Behavioral of shift is

begin

process(dr,en)
begin
if en='1' then
if dr='0' then
  for i in 0 to 63 loop
    y(i+1)<=x(i);
  end loop;
  y(0)<='0';
else 
  for i in 62 to 1 loop
     y(i) <= x(i-1);
  end loop;
  y(63)<='0';
end if;
end if;
end process;

end Behavioral;
