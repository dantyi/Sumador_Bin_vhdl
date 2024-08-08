library IEEE;
use IEEE.std_logic_1164.all;

entity SumadorBinario is
	port (
			A, B : in STD_logic_vector (3 downto 0);
			e : in STD_logic;
			ledA, ledB : out STD_logic_vector (3 downto 0);
			ledS : out STD_logic_vector (4 downto 0);
			seg0, seg1, seg2, seg3, seg4, seg5 : out STD_logic_vector (6 downto 0)
			);
			
end entity SumadorBinario;

architecture codigo of SumadorBinario is
	signal S : STD_logic_vector (4 downto 0); --señal donde se guardara la suma
	begin 
	
	suma: process(A, B, S) --proceso para la suma en paralelo de 4 bits con carry
	variable carry : STD_logic_vector (2 downto 0); --variable donde se guarda el carry de la suma	
	begin

			S(0) <= A(0) XOR B(0);
			carry(0) := A(0) AND B(0);
			S(1) <= A(1) XOR B(1) XOR carry(0);
			carry(1) := (A(1) AND B(1)) OR (carry(0) AND A(1)) OR (carry(0) AND B(1));
			S(2) <= A(2) XOR B(2) XOR carry(1);
			carry(2) := (A(2) AND B(2)) OR (carry(1) AND A(2)) OR (carry(1) AND B(2));
			S(3) <= A(3) XOR B(3) XOR carry(2);
			S(4) <= (A(3) AND B(3)) OR (carry(2) AND A(3)) OR (carry(2) AND B(3));
			
	end process suma;
	
	mostrar: process(A, B, S, e) --proceso con los casos para mostrar los numeros en display
		begin
			ledA <= A;
			ledB <= B;
				case A is --caso para mostrar los numeros de la variable A
					when "0000" =>
								seg1 <= "0000001"; --0
								seg0 <= "1111111";
					when "0001" =>
								seg1 <= "1001111"; --1
								seg0 <= "1111111";
					when "0010" =>
								seg1 <= "0010010"; --2
								seg0 <= "1111111";
					when "0011" =>
								seg1 <= "0000110"; --3
								seg0 <= "1111111";
					when "0100" =>
								seg1 <= "1001100"; --4
								seg0 <= "1111111";
					when "0101" =>
								seg1 <= "0100100"; --5
								seg0 <= "1111111";
					when "0110" =>
								seg1 <= "0100000"; --6
								seg0 <= "1111111";
					when "0111" =>
								seg1 <= "0001111"; --7
								seg0 <= "1111111";
					when "1000" =>
								seg1 <= "0000000"; --8
								seg0 <= "1111111";
					when "1001" =>
								seg1 <= "0000100"; --9
								seg0 <= "1111111";
					when "1010" =>
								seg1 <= "0000001"; --10
								seg0 <= "1001111";
					when "1011" =>
								seg1 <= "1001111"; --11
								seg0 <= "1001111";
					when "1100" =>
								seg1 <= "0010010"; --12
								seg0 <= "1001111";
					when "1101" =>
								seg1 <= "0000110"; --13
								seg0 <= "1001111";
					when "1110" =>
								seg1 <= "1001100"; --14
								seg0 <= "1001111";
					when "1111" =>
								seg1 <= "0100100"; --15
								seg0 <= "1001111";
				end case;

				case B is --caso para mostrar los numeros de la variable B
					when "0000" =>
								seg3 <= "0000001"; --0
								seg2 <= "1111111";
					when "0001" =>
								seg3 <= "1001111"; --1
								seg2 <= "1111111";
					when "0010" =>
								seg3 <= "0010010"; --2
								seg2 <= "1111111";
					when "0011" =>
								seg3 <= "0000110"; --3
								seg2 <= "1111111";
					when "0100" =>
								seg3 <= "1001100"; --4
								seg2 <= "1111111";
					when "0101" =>
								seg3 <= "0100100"; --5
								seg2 <= "1111111";
					when "0110" =>
								seg3 <= "0100000"; --6
								seg2 <= "1111111";
					when "0111" =>
								seg3 <= "0001111"; --7
								seg2 <= "1111111";
					when "1000" =>
								seg3 <= "0000000"; --8
								seg2 <= "1111111";
					when "1001" =>
								seg3 <= "0000100"; --9
								seg2 <= "1111111";
					when "1010" =>
								seg3 <= "0000001"; --10
								seg2 <= "1001111";
					when "1011" =>
								seg3 <= "1001111"; --11
								seg2 <= "1001111";
					when "1100" =>
								seg3 <= "0010010"; --12
								seg2 <= "1001111";
					when "1101" =>
								seg3 <= "0000110"; --13
								seg2 <= "1001111";
					when "1110" =>
								seg3 <= "1001100"; --14
								seg2 <= "1001111";
					when "1111" =>
								seg3 <= "0100100"; --15
								seg2 <= "1001111";
				end case;
				
				if e = '0' then --if comprueba si el boton es presionado
					ledS <= S;
					case S is --Muestra el resultado de la suma "S" si el boton no es presionado
						when "00000" =>
									seg5 <= "0000001"; --0
									seg4 <= "1111111";
						when "00001" =>
									seg5 <= "1001111"; --1
									seg4 <= "1111111";
						when "00010" =>
									seg5 <= "0010010"; --2
									seg4 <= "1111111";
						when "00011" =>
									seg5 <= "0000110"; --3
									seg4 <= "1111111";
						when "00100" =>
									seg5 <= "1001100"; --4
									seg4 <= "1111111";
						when "00101" =>
									seg5 <= "0100100"; --5
									seg4 <= "1111111";
						when "00110" =>
									seg5 <= "0100000"; --6
									seg4 <= "1111111";
						when "00111" =>
									seg5 <= "0001111"; --7
									seg4 <= "1111111";
						when "01000" =>
									seg5 <= "0000000"; --8
									seg4 <= "1111111";
						when "01001" =>
									seg5 <= "0000100"; --9
									seg4 <= "1111111";
						when "01010" =>
									seg5 <= "0000001"; --10
									seg4 <= "1001111";
						when "01011" =>
									seg5 <= "1001111"; --11
									seg4 <= "1001111";
						when "01100" =>
									seg5 <= "0010010"; --12
									seg4 <= "1001111";
						when "01101" =>
									seg5 <= "0000110"; --13
									seg4 <= "1001111";
						when "01110" =>
									seg5 <= "1001100"; --14
									seg4 <= "1001111";
						when "01111" =>
									seg5 <= "0100100"; --15
									seg4 <= "1001111";
						when "10000" =>
									seg5 <= "0100000"; --16
									seg4 <= "1001111";
						when "10001" =>
									seg5 <= "0001111"; --17
									seg4 <= "1001111";
						when "10010" =>
									seg5 <= "0000000"; --18
									seg4 <= "1001111";
						when "10011" =>
									seg5 <= "0000100"; --19
									seg4 <= "1001111";
						when "10100" =>
									seg5 <= "0000001"; --20
									seg4 <= "0010010";
						when "10101" =>
									seg5 <= "1001111"; --21
									seg4 <= "0010010";
						when "10110" =>
									seg5 <= "0010010"; --22
									seg4 <= "0010010";
						when "10111" =>
									seg5 <= "0000110"; --23
									seg4 <= "0010010";
						when "11000" =>
									seg5 <= "1001100"; --24
									seg4 <= "0010010";
						when "11001" =>
									seg5 <= "0100100"; --25
									seg4 <= "0010010";
						when "11010" =>
									seg5 <= "0100000"; --26
									seg4 <= "0010010";
						when "11011" =>
									seg5 <= "0001111"; --27
									seg4 <= "0010010";
						when "11100" =>
									seg5 <= "0000000"; --28
									seg4 <= "0010010";
						when "11101" =>
									seg5 <= "0000100"; --29
									seg4 <= "0010010";
						when others =>
									seg5 <= "0000001"; --30
									seg4 <= "0000110";
					end case;
				else --Muestra "--" si el boton es presionado
					ledS <= "00000";
					seg5 <= "1111110";
					seg4 <= "1111110";
				end if;
	end process mostrar;
end codigo;