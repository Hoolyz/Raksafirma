/* Trigger that removes extra hours from workers daily hours and inserts them in to their own column as overtime */

create trigger lisääYlityöt
on työaika
for insert, update
as
declare @lisättävätTunnit decimal (4,2)
declare @ylityöTunnit decimal (4,2)
declare @työntekijä char(5)
set @lisättävätTunnit = (select tunnit from inserted)
set @ylityöTunnit = (@lisättävätTunnit - 8)
set @työntekijä = (select työaikatunnus from inserted)
if @lisättävätTunnit > 8
begin
update työaika
set ylityötunnit = @ylityöTunnit where työaikatunnus = @työntekijä
update työaika
set tunnit = 8.00 where työaikatunnus = @työntekijä
end

insert into työaika (työntekijätunnus, työmaatunnus, päivä, tunnit)
values ('T001', 'SC002', '11.06.2014', 10)

update työaika
set tunnit = 9 where päivä = '11.06.2014' 
