class LibraryController < ApplicationController
    def ulibrary
        @libraries = Library.all
        render "ulibrary"
    end

    def mlibraryr
        if session[:member]
            @libraries = Library.all
            render "mlibraryr"
        else
            flash[:alert] = "प्रबन्धक प्रवेशः आवश्यकः!"
            redirect_to member_login_path
        end
    end

    def mlibraryc
        if session[:member]
            render "mlibraryc"
        else
            flash[:alert] = "प्रबन्धक प्रवेशः आवश्यकः!"
            redirect_to member_login_path
        end
    end

    def mlibraryu
        if session[:member]
            @library = Library.find_by(id: params[:id])
            if @library
                render "mlibraryu"
            else
                flash[:alert] = "पुस्तकं न प्राप्तम्!"
                redirect_to all_librarys_path
            end
        else
            flash[:alert] = "प्रबन्धक प्रवेशः आवश्यकः!"
            redirect_to member_login_path
        end
    end

    def mlibrarycp
        if session[:member]
            library = Library.new(
                bookid: params[:bookid],
                name: params[:name],
                author: params[:author],
                serialno: params[:serialno],
                primary_genre: params[:primary_genre],
                secondary_genre: params[:secondary_genre],
                copies: params[:copies],
                present: params[:present],
                content_language: params[:content_language],
                almirah: params[:almirah],
                rack: params[:rack],
                location_in_rack: params[:location_in_rack],
                added_by: params[:added_by],
                issued_to: params[:issued_to],
                doi: params[:doi],
                dor: params[:dor]
            )
            
            if library.save
                library.link.attach(params[:link]) if params[:link].present?
                
                change = Change.new(
                    time: Time.now,
                    email: session[:email],
                    table: "library",
                    cord: "create"
                )
                change.save
                
                flash[:notice] = "नूतनं पुस्तकं योजितम्!"
                redirect_to all_librarys_path
            else
                flash[:alert] = "त्रुटिः: #{library.errors.full_messages.join(', ')}"
                render "mlibraryc"
            end
        else
            flash[:alert] = "प्रबन्धक प्रवेशः आवश्यकः!"
            redirect_to member_login_path
        end
    end
    
    def mlibrarydp
        if session[:member]
            library = Library.find(params[:id])
            library.destroy
            
            change = Change.new(
                time: Time.now,
                email: session[:email],
                table: "library",
                cord: "delete"
            )
            change.save
            
            flash[:notice] = "पुस्तकं विनष्टम्!"
            redirect_to all_librarys_path
        else
            flash[:alert] = "प्रबन्धक प्रवेशः आवश्यकः!"
            redirect_to member_login_path
        end
    end

    def mlibraryup
        if session[:member]
            library = Library.find(params[:id])
            
            if library.update(
                bookid: params[:library][:bookid],
                name: params[:library][:name],
                serialno: params[:library][:serialno],
                author: params[:library][:author],
                primary_genre: params[:library][:primary_genre],
                secondary_genre: params[:library][:secondary_genre],
                copies: params[:library][:copies],
                present: params[:library][:present],
                content_language: params[:library][:content_language],
                almirah: params[:library][:almirah],
                rack: params[:library][:rack],
                location_in_rack: params[:library][:location_in_rack],
                added_by: params[:library][:added_by],
                issued_to: params[:library][:issued_to],
                doi: params[:library][:doi],
                dor: params[:library][:dor]
            )
                library.link.attach(params[:library][:link]) if params[:library][:link].present?
                
                change = Change.new(
                    time: Time.now,
                    email: session[:email],
                    table: "library",
                    cord: "update"
                )
                change.save
                
                flash[:notice] = "पुस्तकं परिवर्तितम्!"
                redirect_to all_librarys_path
            else
                flash[:alert] = "त्रुटिः: #{library.errors.full_messages.join(', ')}"
                render "mlibraryu"
            end
        else
            flash[:alert] = "प्रबन्धक प्रवेशः आवश्यकः!"
            redirect_to member_login_path
        end
    end
end
