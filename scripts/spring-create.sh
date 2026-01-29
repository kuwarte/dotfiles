#!/usr/bin/env bash
# ---------------------------------------------------------------
# SPRING-CREATE.SH
#
# A simple script to create a Spring Boot Maven project from
# Spring Initializr, unzip it, and build it using the Maven wrapper.
# Provide permission first!
#
# USAGE:
#   ./spring-create.sh [PROJECT_NAME] [GROUP_ID] [ARTIFACT_ID] [JAVA_VERSION] [DEPENDENCIES]
#
# DEFAULTS:
#   PROJECT_NAME=springproj
#   GROUP_ID=com.example
#   ARTIFACT_ID=springproj
#   JAVA_VERSION=17
#   DEPENDENCIES=web
# ---------------------------------------------------------------
#
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' 
#
# -----------------------------
# HELP_FUNC
# -----------------------------
show_help() {
    echo "+==============================================================================================+"
 echo -e "| [${YELLOW}USAGE${NC}]:                                                                                     |"
 echo -e "|  ./spring-create.sh [PROJECT_NAME] [GROUP_ID] [ARTIFACT_ID] [JAVA_VERSION] [DEPENDENCIES]    |"
    echo "+==============================================================================================+"
 echo -e "| [${YELLOW}DEFAULTS${NC}]                                                                                   |"
    echo "|  PROJECT_NAME: springproj                                                                    |"
    echo "|  GROUP_ID:     com.example                                                                   |"
    echo "|  ARTIFACT_ID:  springproj                                                                    |"
    echo "|  JAVA_VERSION: 17                                                                            |"
    echo "|  DEPENDENCIES: web                                                                           |"
    echo "+==============================================================================================+"
 echo -e "| [${YELLOW}EXAMPLE${NC}]:                                                                                   |"
    echo "|  ./spring-create.sh my-api com.myapp api-service 21 web,data-jpa,mysql                       |"
    echo "+==============================================================================================+"
    exit 0
}
#
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
fi
#
#
# -----------------------------
# PARAMS
# -----------------------------
PROJECT_NAME=${1:-springproj}
GROUP_ID=${2:-com.example}
ARTIFACT_ID=${3:-springproj}
JAVA_VERSION=${4:-17}
DEPENDENCIES=${5:-web}
#
# -----------------------------
# DEST_DIR
# -----------------------------
DEST_DIR=$(pwd)
#
# -----------------------------
# PROJ_INFO
# -----------------------------
echo "CREATING SPRING BOOT PROJECT: $PROJECT_NAME"
echo "GROUPID: $GROUP_ID"
echo "ARTIFACTID: $ARTIFACT_ID"
echo "JAVA VERSION: $JAVA_VERSION"
echo "DEPENDENCIES: $DEPENDENCIES"
#
# -----------------------------
# SET_ZIP_&_PROJ_DIR
# -----------------------------
ZIP_FILE="$DEST_DIR/$PROJECT_NAME.zip"
PROJECT_DIR="$DEST_DIR/$PROJECT_NAME"
#
# -----------------------------
# ALR_EXIST?
# -----------------------------
if [ -d "$PROJECT_DIR" ]; then
    read -p "[]> FOLDER $PROJECT_DIR EXISTS. OVERWRITE? (y/N): " confirm
    if [[ $confirm == [yY] ]]; then
        rm -rf "$PROJECT_DIR"
    else
        echo -e "${GREEN}[INFO]${NC} ABORTING"
        exit 1
    fi
fi
#
# -----------------------------
# DL_SPRING_BOOT_PROJ
# -----------------------------
echo -e "${BLUE}[COMMAND]${NC}> curl -L 'SPRING INITIALIZR URL' -o $ZIP_FILE"
curl -L "https://start.spring.io/starter.zip?type=maven-project&language=java&name=$PROJECT_NAME&groupId=$GROUP_ID&artifactId=$ARTIFACT_ID&javaVersion=$JAVA_VERSION&dependencies=$DEPENDENCIES" \
  -o "$ZIP_FILE"
#
# -----------------------------
# VRFY_DL
# -----------------------------
if [ ! -f "$ZIP_FILE" ] || [ $(stat -c%s "$ZIP_FILE") -lt 5000 ]; then
    echo -e "${RED}[ERROR]${NC}: FAILED TO DOWNLOAD PROJECT. CHECK DEPENDENCIES OR JAVA VERSION."
    exit 1
fi
#
# -----------------------------
# UNZIP_PROJ
# -----------------------------
echo -e "${BLUE}[COMMAND]${NC}> unzip -q $ZIP_FILE -d $PROJECT_DIR"
unzip -q "$ZIP_FILE" -d "$PROJECT_DIR"
echo -e "${GREEN}[INFO]${NC}: PROJECT UNZIPPED TO $PROJECT_DIR"
#
# -----------------------------
# CLN_ZIP_FILE
# -----------------------------
echo -e "${BLUE}[COMMAND]${NC}> rm $ZIP_FILE"
rm "$ZIP_FILE"
#
# -----------------------------
# NAV_PROJ_DIR
# -----------------------------
echo -e "${BLUE}[COMMAND]${NC}> cd $PROJECT_DIR"
cd "$PROJECT_DIR" || exit
#
# -----------------------------
# PROJ_BUILD
# -----------------------------
echo ""
read -p "[]> DO YOU WANT TO BUILD THE PROJECT NOW? (y/N): " build_confirm
if [[ $build_confirm == [yY] ]]; then
    if [ -f "./mvnw" ]; then
        echo -e "${BLUE}[COMMAND]${NC}> ./mvnw clean install"
        ./mvnw clean install
    else
        echo -e "${BLUE}[COMMAND]${NC}> mvn clean install"
        mvn clean install
    fi
else
    echo -e "${GREEN}[INFO]${NC}: SKIPPING BUILD."
fi
#
# -----------------------------
# CREATION_FINISH
# -----------------------------
echo -e "${GREEN}[INFO]${NC}: SPRING BOOT PROJECT '$PROJECT_NAME' CREATED SUCCESSFULLY."
echo -e "${GREEN}[INFO]${NC}: YOU CAN RUN THE APPLICATION USING: ./mvnw spring-boot:run (OR mvn spring-boot:run IF NO WRAPPER)"
