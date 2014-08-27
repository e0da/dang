BIN_DIR          = $$HOME/bin
SCRIPT_NAME      = dang

INSTALLED_SCRIPT = ${BIN_DIR}/${SCRIPT_NAME}
SCRIPT           = ${PWD}/${SCRIPT_NAME}

usage:
	@echo "make install   # symlink ${SCRIPT} to ${BIN_DIR}"
	@echo "make uninstall # delete ${INSTALLED_SCRIPT}"
	@echo "make bump      # bump the version (for development)"

install: ${BIN_DIR}
	ln -sf "${SCRIPT}" "${INSTALLED_SCRIPT}"

uninstall:
	rm "${INSTALLED_SCRIPT}"

${BIN_DIR}:
	mkdir -p "${BIN_DIR}"

bump: _set_old_version _edit_version _set_new_version
	$(eval MESSAGE=Bump version from ${OLD_VERSION} to ${NEW_VERSION})
	git add VERSION
	git commit -m "${MESSAGE}"
	git tag -a ${NEW_VERSION} -m "${MESSAGE}"
	git checkout release
	git merge --no-ff master -m"Release ${NEW_VERSION}"
	git checkout master

_set_old_version:
	$(eval OLD_VERSION=$(shell cat VERSION))

_edit_version:
	$$EDITOR VERSION

_set_new_version:
	$(eval NEW_VERSION=$(shell cat VERSION))
