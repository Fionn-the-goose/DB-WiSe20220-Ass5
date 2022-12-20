import sqlite3
import sys
import time
import argparse
from pathlib import Path
import logging

logging.basicConfig(level=logging.DEBUG)


class Database:
    def __init__(self, database_path: str, ddl_path: str, dml_path: str, initialize_database: bool = False):
        """ Init this object.

        :param database_path: String with the location of the .sqlite database.
        :param ddl_path: String with the location of the .sql file that contains the data definition commands.
        :param dml_path: String with the location of the .sql file that contains the data manipulation commands.
        :param initialize_database: If true, delete the database at database_path and run self.initialize()
        """
        self.database_path = Path(database_path)
        if initialize_database:
            if self.database_path.exists():
                self.database_path.unlink()
            self.initialize(Path(ddl_path), Path(dml_path))

    def initialize(self, ddl_path: Path, dml_path: Path):
        """ open the file """
        con = sqlite3.connect(self.database_path)
        cur = con.cursor()

        """ generating from File """
        ddl_file = open(ddl_path, 'r')
        for line in ddl_file:
            cur.execute(line)
        con.commit()

        """ filling Generated Database """
        dml_file = open(dml_path, 'r')
        for line in dml_file:
            #print(line)
            cur.execute(line)

        con.commit()
        con.close()
        return None

    def query(self, query: str):
        con = sqlite3.connect(self.database_path)
        cur = con.cursor()
        output = ""
        for row in cur.execute(query):
            print(row)
            #output = output+"\n"+row
        con.commit()
        con.close()
        return output
        """ TODO execute the query against the database. Return the results.
        :param query: The SQL query given with the CLI as a string.
        :return: The results.
        """
        logging.debug(f"Querying: {query}")
        raise NotImplementedError()


def pretty_print(sqlite3_results):
    """ sty there was no time sadly """
    """ TODO Format the results of the query so they look nice. (not graded)
    :param sqlite3_results: the results returned from Database.query()
    :return: A string.
    """
    return str(sqlite3_results)


def main():
    print("""Webshop Database Management
====================================\n
For an overview of commands call: 
    >>> python3 webshop.py -h
or
    Execute > help

To exit type 
    Execute > exit
""")
    parser = argparse.ArgumentParser(description='Webshop Database Management.')
    parser.add_argument('-d', '--database', type=str, default="webshop.sqlite",
                        help="""Path to the .sqlite database. Defaults to a
                             webshop.sqlite file in the same directory as this script""")
    parser.add_argument('--ddl', type=str, default="webshop-ddl.sql",
                        help="""Path to the .sql file that contains the command to define the schema. Defaults to a
                             webshop-ddl.sql file in the same directory as this script""")
    parser.add_argument('--dml', type=str, default="webshop-dml.sql",
                        help="""Path to the .sql file that contains the data to be inserted initially. Defaults to a
                             webshop-dml.sql file in the same directory as this script.""")
    parser.add_argument('-i', '--inot', action="store_false",
                        help="""If set, do not re-initialize the database from the ddl and dml files on start. 
                        If not set and the given database exists, it will be deleted.""")

    try:
        args = parser.parse_args(sys.argv[1:])
    except:
        parser.print_help()
        sys.exit(0)

    try:
        db = Database(database_path=args.database, ddl_path=args.ddl, dml_path=args.dml, initialize_database=args.inot)
    except NotImplementedError:
        logging.exception("Error: 'initialize' is not implemented yet!")
        exit(1)

    while True:
        time.sleep(0.1)
        q = input("Execute > ")
        q = q.strip()

        if q == "exit" or q == "exit()":
            exit()

        if q == "help" or q == "help()":
            parser.print_help()
            continue

        try:
            print(pretty_print(db.query(q)))
        except NotImplementedError:
            logging.exception("Error: 'query' is not implemented yet!")
        except RuntimeError:
            logging.exception("Error: Database is not initialized yet! (call \"initialize\" first)")
        except sqlite3.OperationalError as e:
            logging.error("Error in SQL syntax: " + str(e))


if __name__ == '__main__':
    main()
