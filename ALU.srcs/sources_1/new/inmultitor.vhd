----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2021 15:44:47
-- Design Name: 
-- Module Name: inmultitor - Behavioral
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inmultitor is
  Port ( op: in std_logic_vector(2 downto 0);
  RX: in std_logic_vector(31 downto 0);
  sx: in std_logic;
  RY: in std_logic_vector(31 downto 0);
  sy: in std_logic;
  clk1: in std_logic;
  start: in std_logic;
  ovf: out std_logic;
  zero: out std_logic;
  rdy: out std_logic;
  ACC: out std_logic_vector(63 downto 0);
  sz: out std_logic
   );
end inmultitor;

architecture Behavioral of inmultitor is

component flags is
 Port ( A: in std_logic_vector(31 downto 0);
        zero: out std_logic; 
        ovf : out std_logic);
end component;


component UC_mul is
  Port (op: in std_logic_vector(2 downto 0);
        clk: in std_logic;
        b0: in std_logic;   --bitul 0 al celui de-al doilea operand
        enable: in std_logic;
        load: out std_logic;
        shift: out std_logic;
        sum: out std_logic;
        zero: out std_logic  --cand numaratorulajunge la 0 incheiem algoritmul
        );
end component;

component reg32 is
  Port (D: in std_logic_vector(31 downto 0);
        clk: in std_logic;
        ld: in std_logic;
        shift: in std_logic;
        Q: out std_logic_vector(31 downto 0);
        change: out std_logic);
end component;

component rezInmultire is
  Port (clk:in std_logic;
      B: in std_logic_vector(31 downto 0);
      suma:in std_logic_vector(31 downto 0);
      cOut: in std_logic;
      add: in std_logic;
      ld: in std_logic;
      shift: in std_logic;
      lsb: out std_logic;
      rb: out std_logic_vector(31 downto 0);
      rez_o: out std_logic_vector(63 downto 0));
end component;


component SumSub is
  Port (A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        sel: in std_logic;
        op: in std_logic_vector(2 downto 0);
        Cout: out std_logic;
        rdy: out std_logic;
        S: out std_logic_vector(63 downto 0));
end component;

component registru is
  Port (D: in std_logic_vector(31 downto 0);
  load: in std_logic;
  clk: in std_logic;
  Q: out std_logic_vector(31 downto 0));
end component;

component finishMul is
  Port ( zero1: in std_logic;
         zero2:in std_logic;
         sx: in std_logic;
         sy: in std_logic;
         X: in std_logic_vector(63 downto 0);
         rdyi: in std_logic;
         start: out std_logic;
         rdy: out std_logic;
         sz: out std_logic;
         Y: out std_logic_vector(63 downto 0);
         zero: out std_logic);
end component;

component CLK_signal is
 Port(clock: out std_logic);
end component;

 signal ADDs : std_logic;
 signal Add_out : std_logic_vector(63 downto 0 );
 signal Carry_out : std_logic;
 signal LOADs : std_logic;
 signal RA : std_logic_vector(31 downto 0 );
 signal RB : std_logic_vector(31 downto 0 );
 signal Rxs : std_logic_vector(31 downto 0 ):="00000000000000000000000000000011";
 signal Rys : std_logic_vector(31 downto 0 ):="00000000000000000000000000010000";
 signal SHIFTs : std_logic;
 signal clk: std_logic:='0';
 signal lsb: std_logic:='0';
 signal accS: std_logic_vector(63 downto 0);
 signal starts: std_logic:='1';
 signal rdyS: std_logic;
 signal zero1 : std_logic:='0';
 signal zero2 : std_logic:='0';
 signal ovf1: std_logic:='0';
 signal r: std_logic;
begin



clk<=not clk after 1 ns;


c1: SumSub port map(RA,RB,'0',"000",Carry_out,r,Add_out);
c2: uc_mul port map(op,clk,lsb,starts,LOADs,SHIFTs,ADDs,rdyS);  --corectam cu start
c3: registru port map(RX,LOADs,clk,RA);
c4: rezInmultire port map(clk,RY,ADD_out(31 downto 0),CARRY_out,ADDs,LOADs,SHIFTs,lsb,RB,ACCs);
c6: flags port map(ACCs(31 downto 0),zero1,ovf1);
c7: flags port map(ACCs(63 downto 32),zero2,ovf);
zero<=zero1 and zero2;
sz<=sx or sy;
ACC<=ACCs;










process(rdys) begin
 if rdys='1' then starts<='0';rdy<='1';
 else rdy<='0';
 end if;
end process;
end Behavioral;