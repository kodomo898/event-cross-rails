# Ncloud CLI
# 1. CLI For Windows 파일구성
- jre7 - JRE 1.7이 설치 되어있는 폴더 (특정 운영환경에 종속적이지 않도록 하기위해서 첨부)

- lib - CLI 관련 .jar파일이 있는 폴더

- ncloud.cmd - CLI jar파일을 실행하기 위한 스크립트파일

  ​

#  2. CLI For Windows 실행 명령어
```powershell
@ECHO 명령어 수행전 Configure file 설정
ncloud configure

@ECHO 각 명령어는 help 문서참조
ncloud help
ncloud server help
ncloud loadbalancer help
...
```

