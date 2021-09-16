program Basics;

uses crt, sysutils;

(* this is a comment*)

{ single line comment }

// this is a comment too

type 
nilaiItem = record
    name: string;
    nilai: 'A' .. 'F';
end;

type 
    hari = (Senin, Selasa, Rabu, Kamis, Jumat, Sabtu, Minggu);

var 
    name: string = '';
    nilai: 'A'..'F';
    continueInput: boolean = true;
    daftar: array of nilaiItem;

const 
    dayInWeek = 7;

function prompt(): nilaiItem;
var 
    localNama: string = '';
    localNilai: 'A' .. 'E';
    newEntry: nilaiItem;
begin

    writeln('');

    writeln('Masukan Nama Mahasiswa..');
    readln(localNama);

    writeln('Input Nilai..');
    readln(localNilai);


    newEntry.name := localNama;
    newEntry.nilai := localNilai;
    prompt := newEntry;
end;

function checkConfirm(): boolean;
var
    storeInput: string;
begin
    writeln('Tambahkan Lagi (y/N) ?');

    readln(storeInput);

    if storeInput = 'y' then
        checkConfirm := true
    else
        checkConfirm := false;
end;

procedure cetakHasil(A: Array of nilaiItem);
var
    item: nilaiItem;
    c: integer;
begin
    for c:=0 to (Length(A) - 1 )do
        writeln(IntToStr(c+1) + '. ' + A[c].name + ' --------- ' + A[c].nilai);
end;

var 
    tempEntry: nilaiItem;
    counter: integer = 0;

begin
    // Set Length Dynamic array
    setlength(daftar, 0);


    writeln('Program Input Nilai Kelas XF');
    writeln('-----------');

    while continueInput do
    
    begin
        tempEntry := prompt();

        setlength(daftar, counter + 1);


        daftar[counter] := tempEntry; 
        counter := counter + 1;


        // readln()

        continueInput := checkConfirm();
    end;


    writeln('hasil input : ');
    writeln('');

    cetakHasil(daftar);


    writeln('====== Program Selesai ======');
    
    readkey;
end.