if !User.find_by_name('Elena')
  @user = User.new(name: 'Elena', email: 'e@lena.not', password: '1234', password_confirmation: '1234').save(:validate => false)

  data = [
      [
          id: 1,
          name: 'Need to learn ^.^',
          tasks: [
              [
                  content: "Find how to model task which can belongs to parent or to another task as sub-task"
              ],
              [
                  content: "How to check that sub>sub>sub model belong to user ? <totally mind blow>"
              ],
              [
                  content: "Routing/Validation - need better solution for errors (if we don't wanna render same template and redirect_to instead of render)."
              ],
              [
                  content: "Templates - where to put templates and code if we don't have index method/view?  (maybe helpers as it is in this app ?)"
              ],
              [
                  content: "Controllers - find best solution for checking if user is owner of their record. Better than it's in this app"
              ],
              [
                  content: "Controllers/Models - learn how to get/set collection of related objects",
                  finished: 1
              ],
              [
                  content: "Modules - how to use modules and build better code structure"
              ],
              [
                  content: "Mailers - badum tss? I don't know nothing bout that >.< "
              ],
              [
                  content: "How to turn off debug errors in production"
              ],
              [
                  content: "Learn about decorators, when to use it, why, and how"
              ],

          ],
      ],
      [
          id: 2,
          name: 'Try to...',
          tasks: [
              [
                  content: "1. Learn",
                  finished: 1
              ],
              [
                  content: "2. Work"
              ],
              [
                  content: "3. Earn"
              ],
              [
                  content: "Be better :) Live better!"
              ],
          ],
      ],
      [
          id: 3,
          name: 'Blacklisted',
          tasks: [
              [
                  content: "Suck, fuck, twat, whore"
              ],
              [
                  content: "and many more..."
              ],
              [
                  content: "(but not in task content)"
              ],
          ],
      ],
  ]

  i = 0
  data.each { |board_item|
    board = Board.create(user_id: 1, name: board_item[0][:name])

    if board_item[0][:tasks]
      board_item[0][:tasks].each { |task|
        i += 1
        Task.new(board_id: board_item[0][:id], content: task[0][:content], finished: task[0][:finished], start_date: Date.current).save(:validate => false)

        Comment.create(task_id: i, content: "I'm a vampire ,,,_(;..;)_,,,")
      }
    end
  }
end