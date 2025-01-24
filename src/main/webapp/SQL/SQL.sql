CREATE TABLE userTable(
user_id VARCHAR2(100) PRIMARY KEY,
user_mail VARCHAR2(100),
password VARCHAR2(100) NOT NULL,
user_name VARCHAR2(100)
);

CREATE TABLE serverTable(
server_code NUMBER PRIMARY KEY,
user_id VARCHAR2(100),
sever_name VARCHAR2(100) NOT NULL,
CONSTRAINT fk_user_id1 FOREIGN KEY (user_id) REFERENCES userTable (user_id)
);

CREATE TABLE boardTable (
    server_code NUMBER,    
    board_code NUMBER,                  
    title VARCHAR2(255) NOT NULL,       
    author VARCHAR2(100) NOT NULL,     
    post_date DATE DEFAULT SYSDATE,     
    content LONG,                      
    attachment VARCHAR2(4000),   
    PRIMARY KEY(server_code, board_code),
    CONSTRAINT fk_server_code FOREIGN KEY (server_code) REFERENCES serverTable (server_code)
);

CREATE TABLE todoList(
todo_code NUMBER,
server_code NUMBER,
todo_title VARCHAR2(100),
post_date DATE DEFAULT SYSDATE,
tag VARCHAR2(1000),
todo_check NUMBER(1),
todo_writer VARCHAR(100),
PRIMARY key(todo_code, server_code),
CONSTRAINT fk_todo_server_code FOREIGN KEY (server_code) REFERENCES serverTable (server_code)
);

CREATE TABLE todoContent (
    todo_code NUMBER,
    server_code NUMBER,
    todo_content LONG,
    attachment VARCHAR2(4000),
    PRIMARY KEY (todo_code, server_code),
    CONSTRAINT fk_todo_content_title_code FOREIGN KEY (todo_code, server_code) REFERENCES todoList (todo_code, server_code)
);

CREATE TABLE mail(
	mail_code NUMBER,
	server_code NUMBER,
	writer VARCHAR2(100),
	post_date DATE DEFAULT SYSDATE,
	mail_title VARCHAR2(100),
	receiver VARCHAR2(100),
	PRIMARY KEY (mail_code, server_code),
	CONSTRAINT fk_mail_code FOREIGN KEY (server_code) REFERENCES serverTable(server_code)
);
	
CREATE TABLE mailContent (
    mail_code NUMBER,
    server_code NUMBER,
    mail_title varchar2(100),
    todo_content LONG,
    attachment VARCHAR2(4000),
    PRIMARY KEY (mail_code, server_code),
    CONSTRAINT fk_mail_content_title_code FOREIGN KEY (mail_code, server_code) REFERENCES mail (mail_code, server_code)
);