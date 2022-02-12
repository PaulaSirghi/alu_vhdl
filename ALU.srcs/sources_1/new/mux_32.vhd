----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.12.2021 14:41:51
-- Design Name: 
-- Module Name: mux_32 - Behavioral
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

entity mux_32 is
  Port (
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        s: in std_logic;
        load: in std_logic;
        rez: out std_logic_vector(31 downto 0));
end mux_32;
architecture Behavioral of mux_32 is

begin
process(A,B,load)
begin
        if load='0' then rez<=B;
        else
        rez<=A;
        end if;
    
end process;

end Behavioral;
