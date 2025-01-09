.MODEL SMALL

.STACK 100h

.DATA
    ; Prompts untuk input data siswa
    promptName DB 'Masukkan nama siswa: $'
    promptProdi DB 0Dh, 0Ah, 'Masukkan prodi siswa: $'
    promptNIM DB 0Dh, 0Ah, 'Masukkan NIM siswa: $'

    ; Labels dan pesan output
    outputHeader DB 0Dh, 0Ah, 'Data Siswa:', 0Dh, 0Ah, '$'
    outputName DB 0Dh, 0Ah, 'Nama: $'
    outputProdi DB 0Dh, 0Ah, 'Prodi: $'
    outputNIM DB 0Dh, 0Ah, 'NIM: $'
    outputSaved DB 0Dh, 0Ah, 'Data anda telah disimpan.', 0Dh, 0Ah, '$'

    ; Buffer untuk input data
    nameBuffer DB 51 DUP('$')  ; Buffer untuk nama (max 50 karakter + 1 terminator)
    prodiBuffer DB 51 DUP('$') ; Buffer untuk prodi (max 50 karakter + 1 terminator)
    nimBuffer DB 16 DUP('$')   ; Buffer untuk NIM (max 15 karakter + 1 terminator)

    ; Baris baru untuk estetika
    newLine DB 0Dh, 0Ah, '$'

.CODE

MAIN PROC
    ; Inisialisasi segmen data
    MOV AX, @DATA
    MOV DS, AX

    ; Meminta Nama Siswa
    LEA DX, promptName          ; Tampilkan prompt "Masukkan nama siswa"
    MOV AH, 09h
    INT 21h

    LEA DX, nameBuffer          ; Baca input untuk nama siswa
    MOV AH, 0Ah
    INT 21h

    ; Memperbaiki input buffer untuk nama
    MOV AL, nameBuffer[1]       ; Ambil panjang string (offset 1 untuk panjang input)
    MOV nameBuffer, '$' ; Tambahkan karakter pembatas '$'

    ; Meminta Prodi Siswa
    LEA DX, promptProdi         ; Tampilkan prompt "Masukkan prodi siswa"
    MOV AH, 09h
    INT 21h

    LEA DX, prodiBuffer         ; Baca input untuk prodi siswa
    MOV AH, 0Ah
    INT 21h

    ; Memperbaiki input buffer untuk prodi
    MOV AL, prodiBuffer[1]      ; Ambil panjang string (offset 1 untuk panjang input)
    MOV prodiBuffer, '$' ; Tambahkan karakter pembatas '$'

    ; Meminta NIM Siswa
    LEA DX, promptNIM           ; Tampilkan prompt "Masukkan NIM siswa"
    MOV AH, 09h
    INT 21h

    LEA DX, nimBuffer           ; Baca input untuk NIM siswa
    MOV AH, 0Ah
    INT 21h

    ; Memperbaiki input buffer untuk NIM
    MOV AL, nimBuffer[1]        ; Ambil panjang string (offset 1 untuk panjang input)
    MOV nimBuffer, '$'  ; Tambahkan karakter pembatas '$'

    ; Tampilkan Header Data Siswa
    LEA DX, outputHeader        ; Tampilkan "Data Siswa:"
    MOV AH, 09h
    INT 21h

    ; Tampilkan Nama Siswa
    LEA DX, outputName          ; Tampilkan "Nama: "
    MOV AH, 09h
    INT 21h

    LEA DX, nameBuffer + 2      ; Tampilkan nama siswa (offset 2 untuk memulai input)
    MOV AH, 09h
    INT 21h

    ; Tampilkan Prodi Siswa
    LEA DX, outputProdi         ; Tampilkan "Prodi: "
    MOV AH, 09h
    INT 21h

    LEA DX, prodiBuffer + 2     ; Tampilkan prodi siswa (offset 2 untuk memulai input)
    MOV AH, 09h
    INT 21h

    ; Tampilkan NIM Siswa
    LEA DX, outputNIM           ; Tampilkan "NIM: "
    MOV AH, 09h
    INT 21h

    LEA DX, nimBuffer + 2       ; Tampilkan NIM siswa (offset 2 untuk memulai input)
    MOV AH, 09h
    INT 21h

    ; Tampilkan Pesan Data Tersimpan
    LEA DX, outputSaved         ; Tampilkan "Data anda telah disimpan."
    MOV AH, 09h
    INT 21h

    ; Tambahkan Baris Baru
    LEA DX, newLine
    MOV AH, 09h
    INT 21h

    ; Keluar dari program
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

END MAIN