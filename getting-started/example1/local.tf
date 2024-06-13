resource "local_file" "asa"{
    filename="abc/abc.txt"
    content="ajsahsj"
    file_permission = "0777"
}
resource "local_sensitive_file" "sensfile"{
    content="sensfile"
    filename="sensfile.txt"
}